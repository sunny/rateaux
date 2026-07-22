# frozen_string_literal: true

require "rateaux/namespaced"
include Rateaux::Namespaced

# rubocop:disable RSpec/Output
desc "Namespaced example: bar and spam"
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
# rubocop:enable RSpec/Output
