[![Build Status](https://travis-ci.org/exempla/dorb.png)](https://travis-ci.org/exempla/dorb)

# DORB - Digital Ocean Ruby Bindings

Interact with the Digital Ocean API in an idiomatic ruby way.

DORB exposes the Digital Ocean API as Ruby objects, has 100% test coverage and supports the entire API.

## Installation

Add this line to your application's Gemfile:

    gem 'dorb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dorb

## Usage

Require the library in your code as

    require 'dorb'


## Configuration

Set your client key and API key

    # This should be in an initializer or similar
    DORB::Config.setup \
      :client_key => 'YOUR_CLIENT_KEY_HERE',
      :api_key => 'YOUR_API_KEY_HERE'

Any method that calls the Digital Ocean API will raise DORB::ConfigurationError if either Client Key or API Key are not configured

## Getting Started



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
