# frozen_string_literal: true

require "rateaux/file_task"
include Rateaux::FileTask

desc "File Task example: Bob and Jim"
file_task "bob.txt", :bob do
  touch "bob.txt"
end
