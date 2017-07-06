source 'https://rubygems.org'

# Specify your gem's dependencies in json_api_responders.gemspec
gemspec

gem 'minitest-ci'   # for CircleCI

group :development do
  gem 'pry'
end

group :test do
  gem 'mocha'
  gem 'minitest-reporters'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'minitest-focus'
  gem 'pry-byebug', group: %i[development test]
  gem 'pry-highlight', group: %i[development test]
  gem 'pry-rails', group: %i[development test]
  gem 'pry-remote', group: %i[development test]
  gem 'warden'
end
