class BookPassDueJob < ApplicationJob
  queue_as :default

  def perform(rent)
    # Do something later
    BookUser.find(rent).update(status: "Due")

    # Create payment record to pay dued books
    Payment.create(book_user_id:rent, url:"none")
  end
end
