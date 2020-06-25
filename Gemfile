source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "rails", github: "rails/rails", branch: "6-0-stable"

# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use development version of Webpacker
gem "webpacker", github: "rails/webpacker"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
# Machine learning for Ruby
gem "eps"
# 🎉 Makes http fun again!
gem "httparty"
# The official AWS SDK for Ruby. https://aws.amazon.com/sdk-for-ruby/
gem "aws-sdk-comprehend"
# A Ruby implementation of GraphQL.
gem "graphql"
gem "graphiql-rails"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  
  # RSpec for Rails 5+
  gem "rspec-rails"
  gem "pry"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", github: "rails/web-console"
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

