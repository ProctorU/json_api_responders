require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "json_api_responders"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    FactoryGirl.definition_file_paths << Pathname.new("../factories")
    FactoryGirl.definition_file_paths.uniq!
    FactoryGirl.find_definitions
  end
end
