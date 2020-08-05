# Change Log
This CHANGELOG follows the format listed at [Our CHANGELOG Guidelines ](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md).
Which is based on [Keep A Changelog](http://keepachangelog.com/)

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]

## [0.2.0] - 2020-08-05
### Breaking Changes
- Update minimum required ruby version to 2.3. Drop unsupported ruby versions.
- Bump `sensu-plugin` dependency from `~> 1.2` to `~> 4.0`

### Added
- Bonsai asset support

### Changed
- Updated bundler dependancy to '~> 2.1'
- Updated rubocop dependency to '~> 0.81.0'
- Remediated rubocop issues - Updated codeclimate-test-reporter to '~> 1.0'
- Updated rake dependency to '~> 13.0'
- Updated github-markup to '~> 3.0'

## [0.1.0] - 2017-09-10
### Added
- missing changelog entries (@majormoses)
- standard PR templates (@majormoses)

### Changed
- update the location of our changelog format (@majormoses)
- updated with standard `.travis.yml` and updated secret for deploy to rubygems (@majormoses)
- updated with standard `.rubocop.yml` (@majormoses)
- updated with standard `Rakefile` (@majormoses)


## [0.0.5]
### Changed
- bumped version of gem

## [0.0.4]
### Fixed
- check-systemd.rb: critical alert when requested service does not exist (@jgnagy)


## 0.0.1 - 2016-04-26
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-systemd/compare/0.2.0...HEAD
[0.2.0]:https://github.com/sensu-plugins/sensu-plugins-systemd/compare/v0.1.0...0.2.0
[0.1.0]:https://github.com/sensu-plugins/sensu-plugins-systemd/compare/v0.0.5...0.1.0
[0.0.5]: https://github.com/sensu-plugins/sensu-plugins-systemd/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-systemd/compare/v0.0.3...v0.0.4
