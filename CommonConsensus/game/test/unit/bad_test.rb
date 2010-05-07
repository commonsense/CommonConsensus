require File.dirname(__FILE__) + '/../test_helper'

class BadTest < Test::Unit::TestCase
  fixtures :bads

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Bad, bads(:first)
  end
end
