require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @user = users(:hoge)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, user: { email: "fuga@fuga.com", password: "fugafuga" }
    assert_response :success
  end

  test "should get destroy" do
    login_user
    delete :destroy
    assert_redirected_to :users
    assert_response :redirect
  end

end
