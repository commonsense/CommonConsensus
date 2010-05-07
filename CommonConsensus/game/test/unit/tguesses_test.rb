require File.dirname(__FILE__) + '/../test_helper'

class TguessesTest < Test::Unit::TestCase
  fixtures :tguesses

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Tguesses, tguesses(:first)
  end
end
