# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |_repo_name| 'https://github.com/#{repo_name}' }

gem 'facebook-messenger'
gem 'rack', '~> 2.0', '>= 2.0.3'

group :test do
  gem 'rspec', '~> 3.7'
end

group :development, :test do
  gem 'dotenv-rails', '~> 2.2'
  gem 'rubocop', '~> 0.51.0', require: false
end
