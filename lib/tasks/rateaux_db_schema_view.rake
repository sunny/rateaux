# frozen_string_literal: true

# View database schema.
#
#     $ rake db:schema:view
require "terminal-table"
namespace :db do
  namespace :schema do
    desc "View database schema"
    task :view do
      @environment = ENV["RACK_ENV"] || "development"
      @dbconfig = YAML.load_file("config/database.yml")
      ActiveRecord::Base.establish_connection @dbconfig[@environment]
      tables = ActiveRecord::Base.connection.tables.reject do |t|
        t == "schema_migrations"
      end
      tables.each do |table|
        rows = ActiveRecord::Base.connection.columns(table).map do |column|
          [column.name, column.type]
        end
        table = Terminal::Table.new title: table.capitalize.to_s,
                                    headings: %w[Name Type], rows: rows
        puts table
      end
    end
  end
end
