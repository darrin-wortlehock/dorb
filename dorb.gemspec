# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dorb/version'

Gem::Specification.new do |spec|
  spec.name          = "dorb"
  spec.version       = Dorb::VERSION
  spec.authors       = ["Darrin Wortlehock"]
  spec.email         = ["darrin@exempla.co.uk"]
  spec.description   = %q{Digital Ocean Ruby Bindings}
  spec.summary       = %q{Ruby library to abstract the Digital Ocean API}
  spec.homepage      = "https://github.com/exempla/dorb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
