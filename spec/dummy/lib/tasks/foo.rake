require "rateaux/namespaced"
include Rateaux::Namespaced

desc "Bar and spam"
namespaced :foo, [:bar, :spam] do
  desc "Bar"
  task :bar do
    puts "This is the foo:bar task"
  end

  desc "Spam"
  task :spam do
    puts "This is the foo:spam task"
  end
end
