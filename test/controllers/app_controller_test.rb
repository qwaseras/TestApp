require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get room" do
    get app_room_url
    assert_response :success
  end

  test "should get registration" do
    get app_registration_url
    assert_response :success
  end

  test "should get change" do
    get app_change_url
    assert_response :success
  end

end
