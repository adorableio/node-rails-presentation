require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NodeRailsPres
  class Application < Rails::Application
    # Tell the asset pipeline to add bower_components
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

    # Adds commandline options to the browserify execution
    # - Coffeeify transform
    # - Debowerify transform to enable easily using bower components in bowerify
    # - Consider files with specified EXTENSION as modules
    config.browserify_rails.commandline_options = [
      '--transform coffeeify',
      '--transform debowerify',
      '--extension=\".js.coffee\"'
    ]

    # Adds paths to the browserify lookup path so that we can easily use
    # require() with different javascript resources, including bower components
    # - Javascript assets from /vendor
    # - Packages we install from bower
    config.browserify_rails.paths << %w(/vendor/assets/javascripts/ /vendor/assets/bower_components/)
  end
end
