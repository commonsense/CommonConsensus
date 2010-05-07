require File.dirname(__FILE__) + '/../test_helper'

class ControlTest < Test::Unit::TestCase
  fixtures :controls

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Control, controls(:first)
  end
end
