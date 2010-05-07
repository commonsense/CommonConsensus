require File.dirname(__FILE__) + '/../test_helper'
require 'concepts_controller'

# Re-raise errors caught by the controller.
class ConceptsController; def rescue_action(e) raise e end; end

class ConceptsControllerTest < Test::Unit::TestCase
  def setup
    @controller = ConceptsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
