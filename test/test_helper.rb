ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'database_cleaner'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # Add more helper methods to be used by all tests here...

  def sign_in(user)
    post user_session_path \
      'user[email]'    => user.email,
      'user[password]' => user.password
  end

  DatabaseCleaner.strategy = :transaction
  setup do
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end
end
