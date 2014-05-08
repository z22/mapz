source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3', '~> 1.3.9'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'geocoder'
gem 'gmaps4rails'
gem 'underscore-rails'
gem 'guard-livereload', require: false, group: [:development, :test]
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'
gem 'therubyracer'
gem 'less-rails-bootstrap'
gem 'less-rails'
gem 'haml'
# gem 'omniauth-google-apps'
gem 'bcrypt-ruby', :require => "bcrypt"

gem 'groupify'
gem 'figaro' #secret token management
gem 'omniauth-twitter'
gem 'rails_admin'

gem 'google-api-client', :require => 'google/api_client'
gem 'omniauth'
gem 'omniauth-google-oauth2', :git => 'https://github.com/zquestz/omniauth-google-oauth2.git'


#rspec
gem 'rspec-rails', group: [:development, :test]
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "database_cleaner", ">= 0.9.1", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test

gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false
gem "capybara", ">= 2.0.2", :group => :test

gem "devise", ">= 2.2.3"
gem "quiet_assets", ">= 1.0.1", :group => :development
gem "better_errors", ">= 0.3.2", :group => :development
gem "binding_of_caller", ">= 0.6.8", :group => :development
gem "launchy", ">= 2.1.2", :group => :test