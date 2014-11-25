if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

ENV["RAILS_ENV"] = 'test'

require File.expand_path("../../config/environment",  __FILE__)
Rails.backtrace_cleaner.remove_silencers!

require "rspec/rails"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

ActiveRecord::Migration.check_pending!

RSpec.configure do |config|
  config.include PageHelper  

  config.include OfficeClerk::Engine.routes.url_helpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an individual spec file.
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random
end
