require File.dirname(__FILE__) + '/../test_helper'

class FeedbackTest < Test::Unit::TestCase
  fixtures :feedbacks

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Feedback, feedbacks(:first)
  end
end
