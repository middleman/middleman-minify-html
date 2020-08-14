require 'bundler'
Bundler::GemHelper.install_tasks

require 'cucumber/rake/task'
require 'rake/clean'

Cucumber::Rake::Task.new(:cucumber, 'Run features that should pass') do |t|
  ENV["TEST"] = "true"
  t.cucumber_opts = "--color --strict --format #{ENV['CUCUMBER_FORMAT'] || 'pretty'}"
end

task :test => [:cucumber]

desc "Build HTML documentation"
task :doc do
  sh 'bundle exec yard'
end

task('default').clear

desc 'Run all tests'
task default: [:test]
