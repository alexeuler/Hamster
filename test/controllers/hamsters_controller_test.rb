require 'test_helper'

class HamstersControllerTest < ActionController::TestCase
  setup do
    @hamster = hamsters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hamsters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hamster" do
    assert_difference('Hamster.count') do
      post :create, hamster: { address: @hamster.address, email: @hamster.email, name: @hamster.name, phone: @hamster.phone }
    end

    assert_redirected_to hamster_path(assigns(:hamster))
  end

  test "should show hamster" do
    get :show, id: @hamster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hamster
    assert_response :success
  end

  test "should update hamster" do
    patch :update, id: @hamster, hamster: { address: @hamster.address, email: @hamster.email, name: @hamster.name, phone: @hamster.phone }
    assert_redirected_to hamster_path(assigns(:hamster))
  end

  test "should destroy hamster" do
    assert_difference('Hamster.count', -1) do
      delete :destroy, id: @hamster
    end

    assert_redirected_to hamsters_path
  end
end
