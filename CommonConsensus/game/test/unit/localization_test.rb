#!/bin/env ruby

require File.dirname(__FILE__) + '/../test_helper'

class LocalizationTest < Test::Unit::TestCase
  
  include Localization
  
  # TODO: shouldn't use production data for tests
  # require File.dirname(__FILE__) + '/../test_helper'
  TRANSLATION_TABLE = LOCALIZED_STRINGS['localizations']
  CONFIG[:default_language] = 'localizations'

  def test_normal_translation
    assert_equal TRANSLATION_TABLE[:available_forums], l(:available_forums)
  end

  def test_unknown_string
    assert_equal 'test_symbol_that_has_no_traslation', l(:test_symbol_that_has_no_traslation)
  end
  
  def test_with_arguments
    assert_match /an argument/, l(:registration_email_sent, 'an argument')
  end

  def test_missing_an_expected_argument
    assert_raise (ArgumentError) { l(:registration_email_sent) }
  end

  def test_arguments_as_array
    assert_match /an argument/, l([:registration_email_sent, 'an argument'])
  end

  def test_arguments_empty_array
    assert_raise(ArgumentError) { l([]) }
  end

  def test_array_and_arguments
    assert_raise(ArgumentError) { l([:registration_email_sent, 'an argument'], 'some more arguments') }
  end

  def test_LString_to_s
    # was a silly bug
    assert_nothing_raised { LString.new(:registration_email_sent, 'an argument').to_s }
  end

end
