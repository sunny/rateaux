# frozen_string_literal: true

# Delete orhphaned migrations.
#
#     $ rake db:migrate:delete_orphaned
namespace :db do
  namespace :migrate do
    desc "Delete migrations that don’t have associated files anymore"
    task delete_orphaned: :environment do
      removed_file_versions =
        ActiveRecord::Base
        .connection_pool
        .migration_context
        .migrations_status
        .filter_map { |_, version, name| version if name.include?("NO FILE") }

      removed_file_versions.each do |version|
        puts "Deleting orphaned version #{version}"
        sql = "DELETE FROM schema_migrations WHERE version = '#{version}'"
        ActiveRecord::Base.connection.execute(sql)
      end
    end
  end
end
