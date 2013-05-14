# encoding: UTF-8

namespace :notes do
  task :mine do
    me = `whoami`.strip
    p Rake::Task['notes:custom'].arg_names
    #Rake::Task['notes:custom'].set_arg_names([:annotation])
    Rake::Task['notes:custom'].invoke("TODO @#{me}")
  end
end
