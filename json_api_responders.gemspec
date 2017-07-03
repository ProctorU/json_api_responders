# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'json_api_responders/version'

Gem::Specification.new do |spec|
  spec.name = 'json_api_responders'
  spec.version = JsonApiResponders::VERSION
  spec.authors = ['Kevin Brown']
  spec.email = ['kdbrown@proctoru.com']

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
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '~> 4.1'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
