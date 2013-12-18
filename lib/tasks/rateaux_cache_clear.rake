# encoding: UTF-8
#
# Empty Rails cache
#
#     $ rake cache_clear

desc "Empty Rails cache"
task :cache_clear => :environment do
  Rails.cache.clear
end
