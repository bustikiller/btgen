$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "btgen/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "btgen"
  s.version     = Btgen::VERSION
  s.authors     = ["Manuel Bustillo"]
  s.email       = ["mayn13@gmail.com"]
  s.homepage    = "https://github.com/bustikiller/btgen"
  s.summary     = "Rails helper to generate bootstrap tables"
  s.description = "Rails helper to generate bootstrap tables"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "bh", "~>1.3.6"
  s.add_dependency "rails", ">= 3.0.0"
  s.add_dependency "simple_form", "~>3.5"
  s.add_dependency "jquery-rails", "~>4.3.1"
  s.add_dependency "jquery-ui-rails", "~>6.0.1"
  s.add_dependency "bootstrap-sass", "~>3.3.7"

  s.add_development_dependency "sqlite3"
end
