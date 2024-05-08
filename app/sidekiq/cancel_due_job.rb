class CancelDueJob
  include Sidekiq::Job

  def perform(job_id)
    job = Sidekiq::ScheduledSet.new.find_job(job_id)
    job.delete
  end
end
