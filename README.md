# Node Rails Presentation

## Setup

### Install node

```bash
brew install nodejs
```

## Install project dependencies

```bash
bundle install
# 'npm install' is currently setup to additionally run 'bower install'
npm install
```

## Run the server

```bash
bundle exec rails s
```

## Gotchas

When including 3rd party css files, do not include the .css file extension or Sass will not include the file contents in your source
- Do:  `@import 'somepath/somefile';`

You'll want to be aware of how many node packages you're including and compiling down into your javascript. `npm dedupe` helps with this.
- [https://www.npmjs.org/doc/cli/npm-dedupe.html](https://www.npmjs.org/doc/cli/npm-dedupe.html)
