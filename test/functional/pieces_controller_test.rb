require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pieces)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_piece
    assert_difference('Piece.count') do
      post :create, :piece => { }
    end

    assert_redirected_to piece_path(assigns(:piece))
  end

  def test_should_show_piece
    get :show, :id => pieces(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pieces(:one).id
    assert_response :success
  end

  def test_should_update_piece
    put :update, :id => pieces(:one).id, :piece => { }
    assert_redirected_to piece_path(assigns(:piece))
  end

  def test_should_destroy_piece
    assert_difference('Piece.count', -1) do
      delete :destroy, :id => pieces(:one).id
    end

    assert_redirected_to pieces_path
  end
end
