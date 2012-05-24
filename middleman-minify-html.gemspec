# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-minify-html/version"

Gem::Specification.new do |s|
  s.name        = "middleman-minify-html"
  s.version     = Middleman::MinifyHtml::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Reynolds"]
  s.email       = ["me@tdreyno.com"]
  s.homepage    = "https://github.com/middleman/middleman-minify-html"
  s.summary     = %q{A html whitespace minifier for Middleman}
  s.description = %q{A html whitespace minifier for Middleman}

  s.rubyforge_project = "middleman-minify-html"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency("middleman-core", [">= 3.0.0.beta.3"])
  s.add_runtime_dependency("htmlcompressor")
end
