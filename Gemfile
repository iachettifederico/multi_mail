# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) do |repo|
  "https://github.com/#{repo}.git"
end

ruby "3.2.2"

gem "rails", "~> 7.0.7.2"

gem "awesome_print", "~> 1.9.2"
gem "image_processing", "~> 1.12.2"
gem "importmap-rails", "~> 1.2.1"
gem "pg", "~> 1.5.3"
gem "phlex-rails", "~> 1.0.0"
gem "propshaft", "~> 0.7.0"
gem "puma", "~> 6.3.1"
gem "tailwindcss-rails", "~> 2.0.30"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", "~> 1.8.0", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails", "~> 2.8.1"
end

group :development do
  gem "rspec-rails", "~> 6.0.3"
  gem "rubocop", "~> 1.54.2"
  gem "rubocop-rails", "~> 2.20.2"
  gem "rubocop-rake", "~> 0.6.0"
end

group :test do
  gem "rspec-given", "~> 3.8.2"
end
