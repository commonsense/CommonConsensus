require File.dirname(__FILE__) + '/../test_helper'

class StoryTest < Test::Unit::TestCase
  fixtures :stories

  def setup
    @story = Story.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Story,  @story
  end
end
