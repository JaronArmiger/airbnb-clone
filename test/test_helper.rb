ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  OmniAuth.config.test_mode = true
  omniauth_hash = { provider: 'google', uid: '12345',
  					info: { name: "Guzman", email: "guzman@rico.es" }

  }
  OmniAuth.config.add_mock(:google, omniauth_hash)
  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
end
