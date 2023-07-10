# encoding: UTF-8
#
# Empty Sidekiq queues
#
#     $ rake sidekiq:clear

desc "Empty Sidekiq queues"
namespace :sidekiq do
  task :clear do
    require "sidekiq/api"
    Sidekiq::Queue.new.clear
    Sidekiq::RetrySet.new.clear
  end
end
