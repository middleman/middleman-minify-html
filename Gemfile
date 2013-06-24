source "https://rubygems.org"

gem "middleman-core", :github => "middleman/middleman"

# Specify your gem's dependencies in middleman-minify-html.gemspec
gemspec

gem "rake",     "~> 10.0.3", :require => false
gem "yard",     "~> 0.8.0", :require => false

gem "cucumber", "~> 1.3.1"
gem "fivemat"
gem "aruba",    "~> 0.5.1"
gem "rspec",    "~> 2.12"
gem "builder",  "~> 3.0.0"

# Code Quality
gem "cane", :platforms => [:mri_19, :mri_20], :require => false

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end