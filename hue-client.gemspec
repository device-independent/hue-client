# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hue/client/version'

Gem::Specification.new do |spec|
  spec.name          = "hue-client"
  spec.version       = Hue::Client::VERSION
  spec.authors       = ["Nate Klaiber"]
  spec.email         = ["nate@theklaibers.com"]
  spec.summary       = %q{ Interact with your Philips Hue Lighting system. }
  spec.description   = %q{ Interact with your Philips Hue Lighting system. }
  spec.homepage      = "https://github.com/nateklaiber/hue-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("bundler", "~> 1.5")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("yard")
  spec.add_development_dependency("webmock")

  spec.add_dependency("restless_router", "~> 0.0.3")
  spec.add_dependency("terminal-table")
  spec.add_dependency("faraday")
  spec.add_dependency("faraday_middleware")
end
