require "test_helper"

class WatchersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get watchers_create_url
    assert_response :success
  end

  test "should get show" do
    get watchers_show_url
    assert_response :success
  end

  test "should get edit" do
    get watchers_edit_url
    assert_response :success
  end
end
