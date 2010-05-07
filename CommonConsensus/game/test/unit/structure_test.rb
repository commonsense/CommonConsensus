require File.dirname(__FILE__) + '/../test_helper'

class StructureTest < Test::Unit::TestCase
  fixtures :structures

  def setup
    @structure = Structure.find(1)
  end

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Structure,  @structure
  end
end
