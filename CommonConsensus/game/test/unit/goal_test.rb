require File.dirname(__FILE__) + '/../test_helper'

class GoalTest < Test::Unit::TestCase
  fixtures :goals

  def setup
    @goal = Goal.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Goal,  @goal
  end
end
