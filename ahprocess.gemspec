# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ahprocess/version'

Gem::Specification.new do |spec|
  spec.name          = 'ahprocess'
  spec.version       = AHProcess::VERSION
  spec.authors       = ['Maciej Paruszewski']
  spec.email         = ['maciek.paruszewski@gmail.com']
  spec.summary       = %q{AHProcess provides a way to create Analytic Hierarchy Process decissions with ease.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pry'
end
