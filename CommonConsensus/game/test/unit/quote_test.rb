require File.dirname(__FILE__) + '/../test_helper'

class QuoteTest < Test::Unit::TestCase
  fixtures :quotes

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Quote, quotes(:first)
  end
end
