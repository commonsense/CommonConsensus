require File.dirname(__FILE__) + '/../test_helper'

class QuotesTest < Test::Unit::TestCase
  fixtures :quotes

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Quotes, quotes(:first)
  end
end
