# frozen_string_literal: true

# Empty all of Sidekiq’s queues.
#
#     $ rake sidekiq:flush

namespace :sidekiq do
  desc "Empty Sidekiq queues"
  task flush: :environment do
    if Rails.env.production? && ENV["DISABLE_DATABASE_ENVIRONMENT_CHECK"] != "1"
      raise "This task should not be run in production. Set " \
            "DISABLE_DATABASE_ENVIRONMENT_CHECK=1 to override."
    end

    # Via https://stackoverflow.com/a/38672157/311657
    require "sidekiq/api"
    Sidekiq::RetrySet.new.clear
    Sidekiq::ScheduledSet.new.clear
    Sidekiq::DeadSet.new.clear
    Sidekiq::Stats.new.reset
    Sidekiq::Queue.all.map(&:clear)
  end
end
