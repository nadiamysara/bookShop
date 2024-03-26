class BookPassDueJob < ApplicationJob
  queue_as :default

  def perform(rent)
    # Do something later
    BookUser.find(rent).update(due_status: true, price: 2.00)

    # Create payment record to pay dued books
    # Payment.create(book_user_id:rent)
  end
end
