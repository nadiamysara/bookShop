class UpdatePriceDueJob < ApplicationJob
  #include Sidekiq::Worker
  queue_as :default

  def perform
    update_dues = BookUser.where(due_status: true)
    update_dues.update_all("price = price + 1")
  end
end
