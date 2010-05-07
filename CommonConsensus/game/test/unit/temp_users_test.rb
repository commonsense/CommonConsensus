require File.dirname(__FILE__) + '/../test_helper'

class TempUsersTest < Test::Unit::TestCase
  fixtures :temp_users

  # Replace this with your real tests.
  def test_truth
    assert_kind_of TempUsers, temp_users(:first)
  end
end
