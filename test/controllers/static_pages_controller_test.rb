require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get activate" do
    get :activate
    assert_response :success
  end

end
