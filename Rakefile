#!/usr/bin/env rake
# frozen_string_literal: true

# Bundler

begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

Bundler::GemHelper.install_tasks

# RDoc

begin
  require "rdoc/task"
rescue LoadError
  require "rdoc/rdoc"
  require "rake/rdoctask"
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "Rateaux"
  rdoc.options << "--line-numbers"
  rdoc.rdoc_files.include("README.rdoc")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

# RSpec

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

# RuboCop

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]
