require "test_helper"

class SellersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sellers_create_url
    assert_response :success
  end

  test "should get read" do
    get sellers_read_url
    assert_response :success
  end

  test "should get update" do
    get sellers_update_url
    assert_response :success
  end

  test "should get delete" do
    get sellers_delete_url
    assert_response :success
  end
end
