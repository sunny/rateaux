# encoding: UTF-8
#
# View database schema.
#
#     $ rake db:schema:view
require 'terminal-table'
namespace :db do
    namespace :schema do
      desc 'View database schema'
       task :view  do
         @environment = ENV['RACK_ENV'] || 'development'
         @dbconfig = YAML.load(File.read('config/database.yml'))
         ActiveRecord::Base.establish_connection @dbconfig[@environment]
         tables = ActiveRecord::Base.connection.tables.reject { |t| t == "schema_migrations" }
         tables.each do |table|
           rows = ActiveRecord::Base.connection.columns(table).map{|column| [column.name, column.type] }
           table = Terminal::Table.new :title => "#{table.capitalize}", :headings => ['Name', 'Type'], :rows => rows
           puts table
         end
       end
    end
end
