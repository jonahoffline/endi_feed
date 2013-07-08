# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'endi_feed/version'

Gem::Specification.new do |spec|
  spec.name          = 'endi_feed'
  spec.version       = EndiFeed::VERSION
  spec.authors       = ['Jonah Ruiz']
  spec.email         = ['jonah@pixelhipsters.com']
  spec.description   = %q{EndiFeed is a Ruby Gem for getting the latest news from endi.com}
  spec.summary       = %q{EndiFeed is a Ruby Gem for getting the latest news from endi.com / El Nuevo Dia Newspaper}
  spec.homepage      = 'https://github.com/jonahoffline/endi_feed'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'link_shrink', '~> 0.0.1'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14.0'
  spec.add_development_dependency 'webmock', '~> 1.13.0'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
  spec.add_development_dependency 'simplecov-gem-adapter', '~> 1.0.1'
  spec.add_development_dependency 'coveralls', '~> 0.6.7'
end
