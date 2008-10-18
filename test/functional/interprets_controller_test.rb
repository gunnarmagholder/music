require 'test_helper'

class InterpretsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:interprets)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_interpret
    assert_difference('Interpret.count') do
      post :create, :interpret => { }
    end

    assert_redirected_to interpret_path(assigns(:interpret))
  end

  def test_should_show_interpret
    get :show, :id => interprets(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => interprets(:one).id
    assert_response :success
  end

  def test_should_update_interpret
    put :update, :id => interprets(:one).id, :interpret => { }
    assert_redirected_to interpret_path(assigns(:interpret))
  end

  def test_should_destroy_interpret
    assert_difference('Interpret.count', -1) do
      delete :destroy, :id => interprets(:one).id
    end

    assert_redirected_to interprets_path
  end
end
