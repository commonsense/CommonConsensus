from jinja2.ext import Extension
import inspect 
import os
import re
from datetime import date, datetime, timedelta

def active(request, pattern):
    import re
    if re.search(pattern, request):
        return "class='active' "
    return ''

def intcomma(x):
    if type(x) not in [type(0), type(0L)]:
        raise TypeError("Parameter must be an integer.")
    if x < 0:
        return '-' + intcomma(-x)
    result = ''
    while x >= 1000:
        x, r = divmod(x, 1000)
        result = ",%03d%s" % (r, result)
    return "%d%s" % (x, result)

def sourcecode(func):
    longfile = inspect.getfile(func)
    filename = os.path.basename(longfile)
    line, code = inspect.getsourcelines(func)
    return longfile, filename, line, code

def currency(dollars):
    dollars = round(float(dollars), 2)
    return "$%s%s" % (intcomma(int(dollars)), ("%0.2f" % dollars)[-3:])

def datetimeformat(value, format='H:M d/m/Y'):
    return value.strftime(re.sub('([aAbBcdfHIjmMpSUwWxXyYzZ%])', '%\\1', format))

##
# From Django's humanize.py
def ngettext(singular, plural, number):
    if number == 1: return singular
    return plural

def ungettext(singular, plural, number):
    return ngettext(singular, plural, number)

def pgettext(context, message):
    return message

def ugettext(message):
    return message

gettext = ugettext
_ = gettext

def is_aware(value):
    """
    Determines if a given datetime is aware.

    The logic is described in Python's docs:
    http://docs.python.org/library/datetime.html#datetime.tzinfo
    """
    return value.tzinfo is not None and value.tzinfo.utcoffset(value) is not None


def ordinal(value):
    """
    Converts an integer to its ordinal as a string. 1 is '1st', 2 is '2nd',
    3 is '3rd', etc. Works for any integer.
    """
    try:
        value = int(value)
    except (TypeError, ValueError):
        return value
    suffixes = (_('th'), _('st'), _('nd'), _('rd'), _('th'), _('th'), _('th'), _('th'), _('th'), _('th'))
    if value % 100 in (11, 12, 13): # special case
        return "%d%s" % (value, suffixes[0])
    return "%d%s" % (value, suffixes[value % 10])

def naturalday(value, arg=None):
    """
    For date values that are tomorrow, today or yesterday compared to
    present day returns representing string. Otherwise, returns a string
    formatted according to datetimeformat
    """
    try:
        tzinfo = getattr(value, 'tzinfo', None)
        value = date(value.year, value.month, value.day)
    except AttributeError:
        # Passed value wasn't a date object
        return value
    except ValueError:
        # Date arguments out of range
        return value
    today = datetime.now(tzinfo).date()
    delta = value - today
    if delta.days == 0:
        return _('today')
    elif delta.days == 1:
        return _('tomorrow')
    elif delta.days == -1:
        return _('yesterday')
    return datetimeformat(value, arg)

def timesince(d, now=None, reversed=False):
    """
    Takes two datetime objects and returns the time between d and now
    as a nicely formatted string, e.g. "10 minutes".  If d occurs after now,
    then "0 minutes" is returned.

    Units used are years, months, weeks, days, hours, and minutes.
    Seconds and microseconds are ignored.  Up to two adjacent units will be
    displayed.  For example, "2 weeks, 3 days" and "1 year, 3 months" are
    possible outputs, but "2 weeks, 3 hours" and "1 year, 5 days" are not.

    Adapted from http://blog.natbat.co.uk/archive/2003/Jun/14/time_since
    """
    chunks = (
      (60 * 60 * 24 * 365, lambda n: ungettext('year', 'years', n)),
      (60 * 60 * 24 * 30, lambda n: ungettext('month', 'months', n)),
      (60 * 60 * 24 * 7, lambda n : ungettext('week', 'weeks', n)),
      (60 * 60 * 24, lambda n : ungettext('day', 'days', n)),
      (60 * 60, lambda n: ungettext('hour', 'hours', n)),
      (60, lambda n: ungettext('minute', 'minutes', n))
    )
    # Convert datetime.date to datetime for comparison.
    if not isinstance(d, datetime):
        d = datetime(d.year, d.month, d.day)
    if now and not isinstance(now, datetime):
        now = datetime(now.year, now.month, now.day)

    if not now:
        now = datetime.now()

    delta = (d - now) if reversed else (now - d)
    # ignore microseconds
    since = delta.days * 24 * 60 * 60 + delta.seconds
    if since <= 0:
        # d is in the future compared to now, stop processing.
        return '0 ' + ugettext('minutes')
    for i, (seconds, name) in enumerate(chunks):
        count = since // seconds
        if count != 0:
            break
    s = ugettext('%(number)d %(type)s') % {'number': count, 'type': name(count)}
    if i + 1 < len(chunks):
        # Now get the second item
        seconds2, name2 = chunks[i + 1]
        count2 = (since - (seconds * count)) // seconds2
        if count2 != 0:
            s += ugettext(', %(number)d %(type)s') % {'number': count2, 'type': name2(count2)}
    return s

def timeuntil(d, now=None):
    """
    Like timesince, but returns a string measuring the time until
    the given time.
    """
    return timesince(d, now, reversed=True)

def timeperiod(value):
    delta = (value - datetime.now())
    
    # Positive time.
    if (delta.days >=0):
        # Less then a minute
        if (delta.seconds <=60):
            return str(delta.seconds) + " seconds"
        # Using default timeutil.
        else:
            return timeuntil(value)
    # Returning negative time.
    else:
        # Passed less then minutes.
        if (delta.days == -1 and delta.seconds >= 86340):
            return str(86400 - delta.seconds) + " seconds" + " ago"
        else:
            return timeuntil(datetime.now(),value) + " ago"

def naturaltime(value):
    """
    For date and time values shows how many seconds, minutes or hours ago
    compared to current timestamp returns representing string.
    """
    if not isinstance(value, date): # datetime is a subclass of date
        return value

    now = datetime.now()
    if value < now:
        delta = now - value
        if delta.days != 0:
            return pgettext(
                'naturaltime', '%(delta)s ago'
            ) % {'delta': timesince(value)}
        elif delta.seconds == 0:
            return 'now'
        elif delta.seconds < 60:
            return ungettext(
                'a second ago', '%(count)s seconds ago', delta.seconds
            ) % {'count': delta.seconds}
        elif delta.seconds // 60 < 60:
            count = delta.seconds // 60
            return ungettext(
                'a minute ago', '%(count)s minutes ago', count
            ) % {'count': count}
        else:
            count = delta.seconds // 60 // 60
            return ungettext(
                'an hour ago', '%(count)s hours ago', count
            ) % {'count': count}
    else:
        delta = value - now
        if delta.days != 0:
            return pgettext(
                'naturaltime', '%(delta)s from now'
            ) % {'delta': defaultfilters.timeuntil(value)}
        elif delta.seconds == 0:
            return 'now'
        elif delta.seconds < 60:
            return ungettext(
                'a second from now', '%(count)s seconds from now', delta.seconds
            ) % {'count': delta.seconds}
        elif delta.seconds // 60 < 60:
            count = delta.seconds // 60
            return ungettext(
                'a minute from now', '%(count)s minutes from now', count
            ) % {'count': count}
        else:
            count = delta.seconds // 60 // 60
            return ungettext(
                'an hour from now', '%(count)s hours from now', count
            ) % {'count': count}
