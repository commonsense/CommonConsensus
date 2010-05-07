require File.dirname(__FILE__) + '/../test_helper'

class TempGuessesTest < Test::Unit::TestCase
  fixtures :temp_guesses

  # Replace this with your real tests.
  def test_truth
    assert_kind_of TempGuesses, temp_guesses(:first)
  end
end
