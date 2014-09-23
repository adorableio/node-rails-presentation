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
```

### `.bowerrc`

```
{
  "directory": "vendor/assets/bower_components"
}
```
