source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass',             '~> 3.3.7'
gem 'bootstrap-will_paginate'
gem 'cancancan'
gem 'coffee-rails',               '~> 4.2'
gem 'devise'
gem 'draper'
gem 'haml-rails'
gem 'jbuilder',                   '~> 2.5'
gem 'jquery-rails'
gem 'paperclip',                  '~> 5.2.1'
gem 'puma',                       '~> 3.7'
gem 'rails',                      '~> 5.1.4'
gem 'ransack'
gem 'sass-rails',                 '~> 5.0'
gem 'select2-rails'
gem 'sqlite3'
gem 'turbolinks',                 '~> 5'
gem 'uglifier',                   '>= 1.3.0'
gem 'will_paginate',              '~> 3.1.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'faker'
  gem 'pry'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen',                '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console',           '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
