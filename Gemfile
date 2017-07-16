source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'devise'
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease.
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'pg'
gem 'puma', '~> 3.0' # Use Puma as the app server
gem 'rails', '~> 5.0.3'
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your application faster.
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'therubyracer'  # If using Ruby
gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
gem 'bootstrap-sass', '~> 3.3.6'


group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platform: :mri # Call 'byebug' in the code to debug
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver', '~> 2.53.4'
  gem 'show_me_the_cookies'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring' # Sspeeds up dev. by keeping your app running in the background.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.4.0"
