require "test_helper"

class BookUserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get book_user_create_url
    assert_response :success
  end

  test "should get update" do
    get book_user_update_url
    assert_response :success
  end
end
