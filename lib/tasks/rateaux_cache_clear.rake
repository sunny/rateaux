# encoding: UTF-8
#
# Empty Rails cache
#
#     $ rake cache:clear

namespace :cache do
  desc "Empty Rails cache"
  task clear: :environment do
    Rails.cache.clear
  end
end
