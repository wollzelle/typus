source 'https://rubygems.org'

# Declare your gem's dependencies in typus.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Database Adapters
gem 'pg', '~> 0.18.4'

# Typus can manage lists, trees, trashes, so we want to enable this stuff
# on the demo.
gem 'acts_as_list', github: 'typus/acts_as_list'
gem 'acts_as_tree'
gem 'rails-permalink', '~> 1.0.0'
gem 'rails-trash', github: 'fesplugas/rails-trash'

# Rich Text Editor
gem 'ckeditor-rails', github: 'fesplugas/rails-ckeditor'

# Alternative authentication
gem 'devise', '~> 4.2.0'

# Asset Management
gem 'dragonfly', '~> 1.0.12'
gem 'rack-cache', require: 'rack/cache'
gem 'paperclip', '~> 5.1.0'
gem 'carrierwave', '~> 0.11.2'

# MongoDB
# gem 'mongoid', github: 'mongoid/mongoid'

# Testing stuff
group :test do
  gem 'minitest-rails-capybara' # makes capybara's DSL methods available in Rails minitests
  gem 'poltergeist' # a headless browser (webkit) as capybara driver
  gem 'rails-controller-testing'
end

gem 'puma'
