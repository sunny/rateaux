# encoding: UTF-8
#
# Truncate or delete all data from an SQL database.
#
#     $ rake db:truncate

require 'database_cleaner'

namespace :db do
  desc "Truncate all tables"
  task :truncate => :establish_connection do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  desc "Delete all tables"
  task :delete => :establish_connection do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean
  end

  # Faster than depending on :environment
  task :establish_connection => "db:load_config" do
    config = ActiveRecord::Base.configurations[::Rails.env]
    ActiveRecord::Base.establish_connection
  end

  # Undocumented alias. This is a joke, don't use this.
  task :sandra => :delete
end
