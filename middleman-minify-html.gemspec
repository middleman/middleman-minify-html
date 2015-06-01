# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-minify-html/version"

Gem::Specification.new do |s|
  s.name = "middleman-minify-html"
  s.version = Middleman::MinifyHtml::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Thomas Reynolds"]
  s.email = ["me@tdreyno.com"]
  s.homepage = "https://github.com/middleman/middleman-minify-html"
  s.summary = %q{A HTML whitespace minifier for Middleman}
  s.description = %q{A HTML whitespace minifier for Middleman}
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  s.add_runtime_dependency("middleman-core", [">= 3.2"])
  s.add_runtime_dependency("htmlcompressor", ["~> 0.2.0"])
end