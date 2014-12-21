# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hh/version'

Gem::Specification.new do |spec|
  spec.name          = 'hh'
  spec.version       = HH::VERSION
  spec.authors       = ['Igor Varavko']
  spec.email         = ['ivaravko@me.com']
  spec.description   = %q{A Ruby interface to the HeadHanter.}
  spec.summary       = spec.description
  spec.homepage      = 'http://github.com/ivaravko/hh/'
  spec.license       = 'MIT'

  spec.files         += `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.13'
  spec.add_dependency 'faraday', ['~> 0.8', '< 0.10']
  spec.add_dependency 'faraday_middleware', ['~>0.9', '< 0.11']
  spec.add_dependency 'multi_json', '~> 1.7'
end
