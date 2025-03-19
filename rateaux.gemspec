# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rateaux/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rateaux"
  s.version     = Rateaux::VERSION
  s.authors     = ["Sunny Ripert"]
  s.email       = ["sunny@sunfox.org"]
  s.homepage    = "http://github.com/sunny/rateaux"
  s.summary     = "A collection of usefull Rake tasks for Rails."
  s.description = "A collection of usefull Rake tasks for Rails."

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = ">= 2.7.0"
  s.add_dependency "database_cleaner"
  s.add_dependency "rails", ">= 3.2.20"
  s.add_dependency "terminal-table"

  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-rspec"
  s.add_development_dependency "rubocop-rspec_rails"
  s.add_development_dependency "sqlite3"

  s.metadata["rubygems_mfa_required"] = "true"
end
