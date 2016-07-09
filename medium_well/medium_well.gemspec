# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'medium_well/version'

Gem::Specification.new do |spec|
  spec.name          = "medium_well"
  spec.version       = MediumWell::VERSION
  spec.authors       = ["Jennifer Dixon"]
  spec.email         = ["jenniration@gmail.com"]

  spec.summary       = "Interesting posts"
  spec.description   = "Lists a Medium feed"
  spec.homepage      = "http://rubygems.org/gems/medium_well"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
