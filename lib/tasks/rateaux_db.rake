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

  desc "Drop all tables"
  task :drop_tables => :establish_connection do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table table
    end
  end

  # Alias to keep compatibility between rateaux v1.4.0 and v1.5.0
  task :delete => :drop_tables

  # Faster than depending on :environment
  task :establish_connection => "db:load_config" do
    config = ActiveRecord::Base.configurations[::Rails.env]
    ActiveRecord::Base.establish_connection
  end

  # Undocumented alias. This is a joke, don't use this.
  task :sandra => :delete
end
