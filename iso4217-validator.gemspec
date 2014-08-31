# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso4217/validator/version'

Gem::Specification.new do |spec|
  spec.name          = "iso4217-validator"
  spec.version       = Iso4217::Validator::VERSION
  spec.authors       = ["merlos"]
  spec.email         = ["jmmerlos@merlos.org"]
  spec.summary       = %q{rails validator to check that a currency code is defined on the ISO4217}
  spec.description   = %q{Ruby on Rails validator that verifies that a currency code belongs to the list defined in the ISO4217}
  spec.homepage      = "http://github.com/merlos/iso4217-validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "activerecord", "~> 0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "minitest", "~> 0"

end
