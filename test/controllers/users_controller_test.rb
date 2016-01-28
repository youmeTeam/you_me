require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @user = users(:hoge)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "fuga@fuga.com", password: "fugafuga", password_confirmation: "fugafuga" }
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    login_user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    login_user
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    login_user
    patch :update, id: @user, user: { password: "fugafuga", password_confirmation: "fugafuga" }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    login_user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
