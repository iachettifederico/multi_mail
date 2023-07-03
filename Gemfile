source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.6"
gem "propshaft", "~> 0.7.0"
gem "puma", "~> 6.3.0"
gem "tailwindcss-rails", "~> 2.0.29"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "phlex-rails", "~> 1.0.0"
gem "pg", "~> 1.5.3"

group :development, :test do
  gem "debug", "~> 1.8.0", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
end

group :development do
  gem "rubocop", "~> 1.54.0"
  gem "rubocop-rails", "~> 2.20.2"
  gem "rubocop-rake", "~> 0.6.0"
  gem "rubocop-rspec", "~> 2.22.0"
end
