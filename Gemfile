source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "rails" 

# Use postgresql as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma"
gem "webpacker"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis"
# Use Active Model has_secure_password
# gem "bcrypt"

# Use Active Storage variant
# gem "image_processing", "~> 1.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
# Machine learning for Ruby
gem "eps"
# 🎉 Makes http fun again!
gem "httparty"
# The official AWS SDK for Ruby. https://aws.amazon.com/sdk-for-ruby/
gem "aws-sdk-comprehend"
# A Ruby implementation of GraphQL.
gem "graphql"
# Mount the GraphiQL IDE in Ruby on Rails.
gem "graphiql-rails"
# The simplest way to group temporal data.
gem "groupdate"
# Pretty print your Ruby objects with style -- in full color and with proper indentation.
gem "awesome_print"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # RSpec for Rails 5+
  gem "rspec-rails"
  # A runtime developer console and IRB alternative with powerful introspection capabilities.
  gem "pry"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", github: "rails/web-console"
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen"
end
