# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'json_api_responders/version'

Gem::Specification.new do |spec|
  spec.name = 'json_api_responders'
  spec.version = JsonApiResponders::VERSION
  spec.authors = ['Stanko Krtalić Rusendić', 'Kevin Brown']
  spec.email = ['stanko.krtalic@gmail.com', 'kdbrown@proctoru.com']

  spec.summary = 'Automatically respond to JSON::API requests'
  spec.description = 'Automatically respond to JSON::API requests'
  spec.homepage = 'https://github.com/ProctorU/json_api_responders'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise(
      'RubyGems 2.0 or newer is required to protect against public gem pushes.'
    )
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '~> 5.0'
  spec.add_development_dependency "sqlite3"
end
