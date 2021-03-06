# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require_relative 'lib/sensu-plugins-systemd'

Gem::Specification.new do |s|
  s.name                  = 'sensu-plugins-systemd'
  s.version               = SensuPluginsSystemd::Version::VER_STRING
  s.platform              = Gem::Platform::RUBY
  s.authors               = ['mickfeech and contributors']
  s.email                 = [
    'cmcfee@kent.edu',
    '<sensu-users@googlegroups.com>'
  ]
  s.executables           = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.homepage              = 'https://github.com/mickfeech/sensu-plugins-systemd'
  s.summary               = 'This provides functionality to check systemd services.'
  s.description           = 'Plugins to provide functionality to check systemd services for Sensu, a monitoring framework'
  s.license               = 'MIT'
  s.has_rdoc              = false
  s.require_paths         = ['lib']
  s.required_ruby_version = '>= 2.3'
  s.files                 = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  # s.test_files    = Dir['test/*.rb']
  s.test_files            = s.files.grep(%r{^(test|spec|features)/})

  s.add_runtime_dependency 'sensu-plugin', '~> 4.0'
  # s.add_dependency('json')
  # s.add_dependency('mixlib-cli', '>= 1.5.0')

  s.add_development_dependency 'bundler',                   '~> 2.1'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  s.add_development_dependency 'github-markup',             '~> 4.0'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 13.0'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rspec',                     '~> 3.4'
  s.add_development_dependency 'rubocop',                   '~> 0.81.0'
  s.add_development_dependency 'yard',                      '~> 0.8'
end
