$:.push File.expand_path("../lib", __FILE__)

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

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.17"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "jquery-rails"
end
