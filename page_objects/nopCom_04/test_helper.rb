require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'pry'
require 'pry-debugger'
require 'yaml'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/reporters'
require 'awesome_print'
require 'faker'

require 'active_support/dependencies'
require 'active_support/time'
require 'active_record'
require 'fulcrum_specs_lib'


Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

Capybara.default_driver = :selenium
Capybara.app_host = 'http://demo.nopcommerce.com'

Dir["#{File.dirname(__FILE__)}/sections/**/*.rb"].each { |file| require file }
Dir["#{File.dirname(__FILE__)}/pages/**/*.rb"].each { |file| require file }