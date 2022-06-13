ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
# require "rails/backtrace_cleaner"
require "minitest/reporters"
Minitest::Reporters.use!
# Minitest.backtrace_filter = Rails.backtrace_cleaner

# Minitest::Reporters.use!(
#       Minitest::Reporters::DefaultReporter.new,
#       ENV,
#       Rails.backtrace_cleaner
#     )

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
