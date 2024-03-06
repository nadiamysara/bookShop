require "test_helper"

class BookUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_user = book_users(:one)
  end

  test "should get index" do
    get book_users_url
    assert_response :success
  end

  test "should get new" do
    get new_book_user_url
    assert_response :success
  end

  test "should create book_user" do
    assert_difference("BookUser.count") do
      post book_users_url, params: { book_user: { book_id_id: @book_user.book_id_id, due_date: @book_user.due_date, return_date: @book_user.return_date, status: @book_user.status, user_id_id: @book_user.user_id_id } }
    end

    assert_redirected_to book_user_url(BookUser.last)
  end

  test "should show book_user" do
    get book_user_url(@book_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_user_url(@book_user)
    assert_response :success
  end

  test "should update book_user" do
    patch book_user_url(@book_user), params: { book_user: { book_id_id: @book_user.book_id_id, due_date: @book_user.due_date, return_date: @book_user.return_date, status: @book_user.status, user_id_id: @book_user.user_id_id } }
    assert_redirected_to book_user_url(@book_user)
  end

  test "should destroy book_user" do
    assert_difference("BookUser.count", -1) do
      delete book_user_url(@book_user)
    end

    assert_redirected_to book_users_url
  end
end
