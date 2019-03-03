# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sharing
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    Raven.configure do |config|
      config.dsn = "https://183e2bce8bdf458097f7265fade96786:a6b2a6df9beb432883cba59c1c02da13@sentry.io/1406614"
      config.filter_parameters << :password
    end

    Raven.configure do |config|
      config.environments = %w[production]
    end
  end
end
