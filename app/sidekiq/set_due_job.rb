class SetDueJob
  include Sidekiq::Job

  def perform(val)
    # BookUser.find(val).update(due_status: true, price: 2.00, jid: self.jid)
    BookUser.find(val).update(due_status: true, price: 2.00)
  end
end
