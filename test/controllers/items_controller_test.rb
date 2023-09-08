require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get items_create_url
    assert_response :success
  end

  test "should get read" do
    get items_read_url
    assert_response :success
  end

  test "should get update" do
    get items_update_url
    assert_response :success
  end

  test "should get delete" do
    get items_delete_url
    assert_response :success
  end
end
