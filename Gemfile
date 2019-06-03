source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.4.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.12"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.9"
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.13"

# Use ActiveStorage variant
gem "mini_magick", "~> 4.9"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

gem "will_paginate", "~> 3.1.0"
gem "will_paginate-bootstrap4"

gem "faraday"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  gem "capybara"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 3.8"
  gem "rspec_junit_formatter"
  gem "rubocop"
  gem "shoulda-matchers", "~> 4.0"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "dotenv-rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
