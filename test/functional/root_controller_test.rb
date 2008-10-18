require 'test_helper'

class RootControllerTest < ActionController::TestCase
  def test_get_on_index_should_succeed
    get :index
    assert_response :success
  end
  
  def test_get_on_index_should_have_a_hello_message
    get :index
    assert_select "h1", "Music 4 the classes"
  end
end
