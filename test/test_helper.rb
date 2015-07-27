ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# Get the default Rails tests to show #FF0000 and #00FF00
# at the appropriate times
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test uer is logged in.
  def is_logged_in?
  	!session[:user_id].nil?
  end
end
