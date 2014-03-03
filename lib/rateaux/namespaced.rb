# encoding: UTF-8
#
# Namespaced
#
# Adds a namespace and a task with that namespace name.
#
# Choose the tasks you want to launch when using the namespace name
# by giving them as a second argument or by defning a "default" task.
#
# For example:
#
#     require "rateaux/namespaced"
#     include Rateaux::Namespaced
#
#     desc "Export everything"
#     namespaced :export do
#       default: [:a, :b]
#
#       …
#     end
#
# Is the same as:
#
#     require "rateaux/namespaced"
#     include Rateaux::Namespaced
#
#     desc "Export everything"
#     namespaced :export, [:a, :b] do
#       …
#     end
#
# Both definitions add a task "export" that cals "export:a" and "export:b"
# without having to add:
#
#     task export: ["export:a", "export:b"]
#
module Rateaux
  module Namespaced
    def namespaced(name, defaults = :default)
      case defaults
      when Symbol, String
        task name => "#{name}:#{defaults}"
      when nil
        task name
      else
        task name => defaults.to_a.map { |t| "#{name}:#{t}" }
      end

      namespace name do
        yield
      end
    end
  end
end
