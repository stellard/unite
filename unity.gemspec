# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unity/version"

Gem::Specification.new do |s|
  s.name        = "unity"
  s.version     = Unity::VERSION
  s.authors     = ["stellard"]
  s.email       = ["scott.ellard@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "unity"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency "activesupport"
  s.add_dependency "activemodel"
  # s.add_runtime_dependency "rest-client"
end
