require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SalesClerk
  class Application < Rails::Application

    #indicate that we have stylesheet/js stuff to be added to office, with the given name
    # files (css + js) must exist in asset path
    def office_assets
      "sales_office"
    end

    # don't generate RSpec tests for views and helpers
    config.generators do |g|

      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.helper_specs false
    end

    config.to_prepare do
      Dir.glob("app/**/*_decorator.rb").each do |c|
        load(c)
      end
    end
  end
end
