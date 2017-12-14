source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in fortuneteller.gemspec
gemspec

gem 'activesupport', '~> 5.0'
gem 'rubocop', require: false

group :profiling do
  gem 'ruby-prof'
  gem 'ruby-prof-flamegraph'
end
