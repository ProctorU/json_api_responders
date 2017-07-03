$:.unshift File.expand_path('../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'rails/all'
require 'minitest/autorun'
require 'minitest/reporters'

ActiveSupport::TestCase.test_order = :random

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
