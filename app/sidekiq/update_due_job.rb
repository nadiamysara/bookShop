class UpdateDueJob
  include Sidekiq::Job

  def perform(job_id, book_user_id)
    job = Sidekiq::ScheduledSet.new.find_job(job_id)
    # job.reschedule(Time.now + 3.minutes)
    # job.reschedule(BookUser.find(book_user_id).due_date + 3.minutes)
    _new_due = BookUser.find(book_user_id).due_date + 1.minute
    job.reschedule(_new_due)
    BookUser.find(book_user_id).update(due_date: _new_due, extend_limit: BookUser.find(book_user_id).extend_limit + 1)
  end
end
