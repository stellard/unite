# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unite/version"

Gem::Specification.new do |s|
  s.name        = "unite"
  s.version     = Unite::VERSION
  s.authors     = ["stellard"]
  s.email       = ["scott.ellard@gmail.com"]
  s.homepage    = "https://github.com/stellard/unite"
  s.summary     = %q{Unite provides extensions to your objects to support values with units}
  s.description = %q{Unite provides extensions to your objects to support values with units}

  s.rubyforge_project = "unite"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", ">= 3.0.0", "< 5.0"
  s.add_dependency "activemodel", ">= 3.0.0", "< 5.0"

end
