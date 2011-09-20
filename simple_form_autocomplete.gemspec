# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_form_autocomplete/version"

Gem::Specification.new do |s|
  s.name        = "simple_form_autocomplete"
  s.version     = SimpleFormAutocomplete::VERSION
  s.authors     = ["Paul Smith"]
  s.email       = ["paul@elandesign.co.uk"]
  s.homepage    = "http://github.com/elandesign/simple_form_autocomplete"
  s.summary     = "Adds autocomplete inputs to the simple_form library"
  s.description = "Adds autocomplete inputs to the simple_form library"

  s.rubyforge_project = "simple_form_autocomplete"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rails", ">= 3.1"
  s.add_runtime_dependency "simple_form", "~> 1.5.1"
  s.add_runtime_dependency "jquery-rails", "~> 1.0.14"
  
end
