# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unity/version"

Gem::Specification.new do |s|
  s.name        = "unite"
  s.version     = Unity::VERSION
  s.authors     = ["stellard"]
  s.email       = ["scott.ellard@gmail.com"]
  s.homepage    = "https://github.com/stellard/unity"
  s.summary     = %q{Unite provides extensions to your objects to support values with units}
  s.description = %q{Unite provides extensions to your objects to support values with units}

  s.rubyforge_project = "unity"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", ">= 3.0.0"
  s.add_dependency "activemodel", ">= 3.0.0"

end
