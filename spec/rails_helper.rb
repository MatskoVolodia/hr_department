require 'spec_helper'
require 'shoulda/matchers'
require 'support/shoulda'


ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

Dir[Rails.root.join('spec/support/**/*.rb')].each(&method(:require))

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

FactoryBot.definition_file_paths << File.expand_path('../support/factories', __FILE__)

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end
