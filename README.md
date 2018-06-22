## Sensu-Plugins-systemd
[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-systemd.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-systemd)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-systemd.svg)](http://badge.fury.io/rb/sensu-plugins-systemd)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-systemd/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-systemd)
## Functionality
This provides functionality to check if services are running for systemd.

## Files
 - bin/check-systemd.rb

## Usage
Pass services as a comma delimited -s option

```
check-systemd.rb -s SERVICE1.service,SERVICE2.service
```

### Usage/example failed mode
All services with state 'failed' will be reported as CRITICAL except kdump.service

```
check-systemd.rb -f -i kdump.service
```

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
