require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NodeRailsPres
  class Application < Rails::Application
    # Tell the asset pipeline to add bower_components
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    # Tell browserify_rails to use coffeeify
    config.browserify_rails.commandline_options = [
      '-t coffeeify',
      '-t debowerify',
      '--extension=\".js.coffee\"'
    ]

    config.browserify_rails.paths << %w(/vendor/assets/javascripts/ /vendor/assets/bower_components/)
  end
end
