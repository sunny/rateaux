# frozen_string_literal: true

# View database schema.
#
#     $ rake db:schema:view
require "terminal-table"
namespace :db do
  namespace :schema do
    desc "View database schema"
    task view: :environment do
      ActiveRecord::Base.connection.tables.each do |table|
        next if table == "schema_migrations"

        rows = ActiveRecord::Base.connection.columns(table).map do |column|
          [column.name, column.type]
        end
        table = Terminal::Table.new(
          title: table.capitalize.to_s,
          headings: %w[Name Type],
          rows: rows,
        )
        puts table
      end
    end
  end
end
