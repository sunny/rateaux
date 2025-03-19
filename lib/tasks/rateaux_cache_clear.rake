# frozen_string_literal: true

# Empty Rails cache.
#
#     $ rake cache:clear

namespace :cache do
  desc "Empty Rails cache"
  task clear: :environment do
    Rails.cache.clear
  end
end
