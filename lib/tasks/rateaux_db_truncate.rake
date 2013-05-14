# encoding: UTF-8
#
# Truncate all data from an SQL database.
#
#     $ rake db:truncate

namespace :db do
  # http://stackoverflow.com/questions/7755389/rake-task-to-truncate-all-tables-in-rails-3/7792243#comment16456061_7792243
  desc "Truncate all existing data"
  task :truncate => "db:load_config" do
   begin
    config = ActiveRecord::Base.configurations[::Rails.env]
    ActiveRecord::Base.establish_connection

    tables = ActiveRecord::Base.connection.tables.reject { |t| t == "schema_migrations" }
    case config["adapter"]
      when "mysql", "postgresql"
        tables.each do |table|
          ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
        end
      when "sqlite", "sqlite3"
        tables.each do |table|
          ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
          ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
        end
       ActiveRecord::Base.connection.execute("VACUUM")
     end
    end
  end

  desc "Alias to db:truncate"
  task sandra: :truncate
end
