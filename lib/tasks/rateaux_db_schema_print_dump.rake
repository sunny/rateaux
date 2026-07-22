# frozen_string_literal: true

# Print database schema.
#
#     $ rake db:schema:print_dump
namespace :db do
  namespace :schema do
    desc "Print database dump"
    task print_dump: :environment do
      ActiveRecord::SchemaDumper.dump
    end
  end
end
