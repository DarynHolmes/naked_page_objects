# coding: utf-8
# rubocop:disable all
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fulcrum_specs_lib/version'

Gem::Specification.new do |spec|
  spec.name          = 'fulcrum_specs_lib'
  spec.version       = FulcrumSpecsLib::VERSION
  spec.authors       = ['daryn holmes']
  spec.email         = ['productmanagement@net-a-porter.com']
  spec.summary       = 'A library for testing of Fulcrum'
  spec.description   = 'This is the reusable code that enables tests to be written against Fulcrum'
  spec.homepage      = ''
  # spec.license is not specified, this indicates that all rights are reserved to Net-A-Porter

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'require_all', '~> 1.3'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'selenium-webdriver'
  spec.add_dependency 'capybara'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'pg'
end
# rubocop:enable all