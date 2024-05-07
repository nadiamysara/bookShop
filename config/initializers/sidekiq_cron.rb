require 'sidekiq-cron'

Sidekiq::Cron::Job.create(
  name: 'Update due price everyday',
  # cron: '0 9 * * *', # Runs At 09:00 : https://crontab.guru/#0_9_*_*_*
  cron: '*/1 * * * * ', # Runs At every 1st minute
  class: 'UpdatePriceDueJob',
  args: []
)
