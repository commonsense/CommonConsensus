require File.dirname(__FILE__) + '/../test_helper'

class GuessTest < Test::Unit::TestCase
  fixtures :guesses

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Guess, guesses(:first)
  end
end
