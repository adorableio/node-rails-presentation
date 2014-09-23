# Node Rails Presentation

## `Gemfile`

```ruby
gem 'browserify-rails'
```

## `package.json`

```json
{
  ...
  "devDependencies": {
    ...
    "browserify": "^5.9.1",
    "coffeeify": "^0.7.0",
    "debowerify": "^0.7.1"
}
```

## `config/application.rb`

```ruby
...
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

```

### `.bowerrc`

```
{
  "directory": "vendor/assets/bower_components"
}
```
