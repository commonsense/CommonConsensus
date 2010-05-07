# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(unique=True, max_length=240)
    class Meta:
        db_table = u'auth_group'

class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group_id = models.IntegerField(unique=True)
    permission_id = models.IntegerField()
    class Meta:
        db_table = u'auth_group_permissions'

class AuthMessage(models.Model):
    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField()
    message = models.TextField()
    class Meta:
        db_table = u'auth_message'

class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    content_type_id = models.IntegerField()
    codename = models.CharField(unique=True, max_length=300)
    class Meta:
        db_table = u'auth_permission'

class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(unique=True, max_length=90)
    first_name = models.CharField(max_length=90)
    last_name = models.CharField(max_length=90)
    email = models.CharField(max_length=225)
    password = models.CharField(max_length=384)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    is_superuser = models.IntegerField()
    last_login = models.DateTimeField()
    score = models.IntegerField()
    date_joined = models.DateTimeField()
    class Meta:
        db_table = u'auth_user'
    

class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField(unique=True)
    group_id = models.IntegerField()
    class Meta:
        db_table = u'auth_user_groups'

class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField(unique=True)
    permission_id = models.IntegerField()
    class Meta:
        db_table = u'auth_user_user_permissions'


class Concepts(models.Model):
    name = models.CharField(max_length=765, blank=True)
    concept_type = models.IntegerField()
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'concepts'


class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=300)
    app_label = models.CharField(unique=True, max_length=300)
    model = models.CharField(unique=True, max_length=300)
    class Meta:
        db_table = u'django_content_type'
   
class DjangoSession(models.Model):
    session_key = models.CharField(max_length=120, primary_key=True)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        db_table = u'django_session'

class DjangoSite(models.Model):
    id = models.IntegerField(primary_key=True)
    domain = models.CharField(max_length=300)
    name = models.CharField(max_length=150)
    class Meta:
        db_table = u'django_site'

class RelationTypes(models.Model):
    template = models.CharField(max_length=765, blank=True)
    name = models.CharField(max_length=150)
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    concept_type = models.IntegerField()
    class Meta:
        db_table = u'relation_types'

class Games(models.Model):
    id = models.IntegerField(primary_key=True)
    last_game = models.DateTimeField(null=True, blank=True)
    concept = models.ForeignKey(Concepts)
    relation_type = models.ForeignKey(RelationTypes)
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    users_playing = models.IntegerField()
    voted_bad = models.IntegerField()
    voted_irrelevant = models.IntegerField()
    class Meta:
        db_table = u'games'

class RelationTypeConstraints(models.Model):
    source_relation_type_id = models.IntegerField(null=True, blank=True)
    concept_id = models.ForeignKey(Concepts)
    relation_type_id = models.ForeignKey(RelationTypes)
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'relation_type_constraints'



class Bads(models.Model):
    concept = models.ForeignKey(Concepts)
    relation_type = models.ForeignKey(RelationTypes)
    bad_type = models.IntegerField(null=True, blank=True)
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'bads'

class Relations(models.Model):
  left_concept = models.ForeignKey(Concepts, related_name="left_concept")
  right_concept = models.ForeignKey(Concepts, related_name="right_concept")
  relation_type = models.ForeignKey(RelationTypes)
  times = models.IntegerField(null=True, blank=True)
  class Meta:
      db_table = u'relations'


class SchemaMigrations(models.Model):
    version = models.CharField(unique=True, max_length=765)
    class Meta:
        db_table = u'schema_migrations'

   
class Answers(models.Model):
    user = models.ForeignKey(AuthUser)
    relation = models.ForeignKey(Relations)
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    class Meta:
        db_table = u'answers'

class UserAnswers(models.Model):
    # this class is not used
    id = models.IntegerField(primary_key=True)
    user=models.ForeignKey(AuthUser)
    relation=models.ForeignKey(Relations)
    created_at =models.DateTimeField(null=True,blank=True)
    updated_at = models.DateTimeField(null=True,blank=True)
    class Meta:
        db_table=u'user_answers'
