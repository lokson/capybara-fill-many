# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara/fill_many/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-fill-many"
  spec.version       = Capybara::FillMany::VERSION
  spec.authors       = ["lokson"]
  spec.email         = ["kapustka.maciek@gmail.com"]

  spec.summary       = %q{Fill_in sequence of fields in capybara.}
  spec.description   = %q{Fill Many is helper function for capybara tests. It replaces several fill_in statements.}
  spec.homepage      = "https://github.com/lokson/capybara-fill-many"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
