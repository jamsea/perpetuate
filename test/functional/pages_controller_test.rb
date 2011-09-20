require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get mail" do
    get :mail
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
