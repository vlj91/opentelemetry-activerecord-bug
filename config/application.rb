require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "opentelemetry/sdk"
require "opentelemetry/instrumentation/active_record"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OpentelemetryActiverecordBug
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true

    OpenTelemetry::SDK.configure do |otel|
      otel.service_name = 'tasks'
      otel.use "OpenTelemetry::Instrumentation::ActiveRecord"
    end
  end
end
