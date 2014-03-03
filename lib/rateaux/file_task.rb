# encoding: UTF-8
#
# File Task
#
# Adds a task and a file task. The file depends on the task that it creates.
#
#
# For example:
#
#     require "rateaux/file_task"
#     include Rateaux::FileTask
#
#     file_task "foo.txt", create: :environment do
#       touch "foo.txt"
#     end
#
# You can then:
#
#     $ rake foo.txt  # Will create the file only if it does not exist
#     $ rake create   # Will create the file all the time
#
# Your tasks can now depend on the file beeing present or create them :
#
#     task send: "foo.txt"
#
# With file_task you don't have to add this block to the file task:
#
#     file "foo.txt" do
#       Rake::Task["create"]
#     end
#
module Rateaux
  module FileTask
    def file_task(path, definition)
      t = task(definition) do
        yield
      end

      file(path) do
        Rake::Task[t.name].invoke
      end
    end
  end
end
