# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'company/finder/client/version'

Gem::Specification.new do |spec|
  spec.name          = "company-finder-client"
  spec.version       = Company::Finder::Client::VERSION
  spec.authors       = ["Johan Carlsson"]
  spec.email         = ["johancarlsson@me.com"]
  spec.summary       = %q{Retreives company identity numbers given name input}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "nokogiri"
end
