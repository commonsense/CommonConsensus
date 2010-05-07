require File.dirname(__FILE__) + '/../test_helper'

class ConceptTest < Test::Unit::TestCase
  fixtures :concepts

  def setup
    @concept = Concept.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Concept,  @concept
  end
end
