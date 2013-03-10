# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cosmicrawler/version'

Gem::Specification.new do |spec|
  spec.name          = "cosmicrawler"
  spec.version       = Cosmicrawler::VERSION
  spec.authors       = ["Toshiaki Koshiba"]
  spec.email         = ["koshiba+github@4038nullpointer.com"]
  spec.description   = 'Cosmicrawler is crawler library for Ruby. It provides scalable asynchronous crawling by (http|file|etc) using EventMachine.'
  spec.summary       = 'Cosmicrawler is crawler library for Ruby. It provides scalable asynchronous crawling by (http|file|etc) using EventMachine.'
  spec.homepage      = "https://github.com/bash0C7/cosmicrawler"
  spec.license       = "Ruby"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_runtime_dependency("eventmachine")
  spec.add_runtime_dependency("em-http-request")
  spec.add_runtime_dependency("em-synchrony")
end
