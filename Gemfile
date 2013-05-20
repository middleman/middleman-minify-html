source "https://rubygems.org"

git "git://github.com/middleman/middleman.git", :branch => "master" do
  # gem "middleman"
  gem "middleman-core"
end

# Specify your gem's dependencies in middleman-minify-html.gemspec
gemspec

group :development do
  gem "rake",     "~> 10.0.3"
  gem "rdoc",     "~> 3.9"
  gem "yard",     "~> 0.8.0"
end

group :test do
  gem "cucumber", "~> 1.2.0"
  gem "fivemat"
  gem "aruba",    "~> 0.4.11"
  gem "rspec",    "~> 2.7"
  gem "builder",  "~> 3.0.0"
end