class UpdatePriceDueJob < ApplicationJob
  #include Sidekiq::Worker
  queue_as :default

  def perform
    update_dues = BookUser.where(status: "Due")
    update_dues.update_all("price = price + 1")
  end
end
