require File.dirname(__FILE__) + '/../test_helper'

class TusersTest < Test::Unit::TestCase
  fixtures :tusers

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Tusers, tusers(:first)
  end
end
