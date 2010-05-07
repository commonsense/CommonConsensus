require File.dirname(__FILE__) + '/../test_helper'
require 'feud_controller'

# Re-raise errors caught by the controller.
class FeudController; def rescue_action(e) raise e end; end

class FeudControllerTest < Test::Unit::TestCase
  def setup
    @controller = FeudController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
