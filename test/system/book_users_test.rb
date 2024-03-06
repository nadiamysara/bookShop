require "application_system_test_case"

class BookUsersTest < ApplicationSystemTestCase
  setup do
    @book_user = book_users(:one)
  end

  test "visiting the index" do
    visit book_users_url
    assert_selector "h1", text: "Book users"
  end

  test "should create book user" do
    visit book_users_url
    click_on "New book user"

    fill_in "Book id", with: @book_user.book_id_id
    fill_in "Due date", with: @book_user.due_date
    fill_in "Return date", with: @book_user.return_date
    fill_in "Status", with: @book_user.status
    fill_in "User id", with: @book_user.user_id_id
    click_on "Create Book user"

    assert_text "Book user was successfully created"
    click_on "Back"
  end

  test "should update Book user" do
    visit book_user_url(@book_user)
    click_on "Edit this book user", match: :first

    fill_in "Book id", with: @book_user.book_id_id
    fill_in "Due date", with: @book_user.due_date
    fill_in "Return date", with: @book_user.return_date
    fill_in "Status", with: @book_user.status
    fill_in "User id", with: @book_user.user_id_id
    click_on "Update Book user"

    assert_text "Book user was successfully updated"
    click_on "Back"
  end

  test "should destroy Book user" do
    visit book_user_url(@book_user)
    click_on "Destroy this book user", match: :first

    assert_text "Book user was successfully destroyed"
  end
end
