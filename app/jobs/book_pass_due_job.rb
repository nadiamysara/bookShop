class BookPassDueJob < ApplicationJob
  queue_as :default

  def perform(rent)
    # Do something later
    BookUser.find(rent).update(status: "Due")
  end
end
