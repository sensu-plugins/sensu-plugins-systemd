#! /usr/bin/env ruby
#
#   check-systemd.rb
#
# DESCRIPTION:
# => Check the status of the systemd unit.service
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
# -s SERVICE - Services to check delimited by commas
# -f Toogle 'failed mode'
# -i SERVICES - Services to ignore in 'failed mode'. delimited by commas
#
# LICENSE:
#   Chris McFee <cmcfee@kent.edu>
#   Release under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'

#
#  Check systemd services
#
class CheckSystemd < Sensu::Plugin::Check::CLI
  option :services,
         short: '-s SERVICES',
         proc: proc { |a| a.split(',')},
         default: [],
         description: 'comma seperated list of services to check. ignored if --failed is set'
  option :failed,
         short: '-f',
         boolean: true,
         default: false,
         long: '--failed',
         description: 'all services are being checked. One or more failed => CRITICAL'
  option :failed_ignore,
         short: '-i SERVICES',
         proc: proc { |a| a.split(',')},
         default: [],
         long: '--failed-ignore',
         description: 'comma seperated list of services which should be ignored when using --failed mode'

  # Setup variables
  #
  def initialize
    super
    @services = config[:services]
    @failed = config[:failed]
    @failed_ignore =  config[:failed_ignore]
    @crit_service = []
  end

  def all_service_names
    systemd_output = `systemctl --no-legend`
    systemd_output.split("\n").collect do |line|
      line.split(' ').first
    end
  end

  def unit_services
    systemd_output = `systemctl --failed --no-legend`
    service_array = []
    systemd_output.split("\n").each do |line|
      line_array = line.split(' ')
      next unless @services.any? { |service| line_array[0].include?(service) } || @failed == true
      unless @failed_ignore.any? { |service| line_array[0].include?(service) } && @failed == true
        service_hash = {}
        service_hash['name'] = line_array[0]
        service_hash['load'] = line_array[1]
        service_hash['active'] = line_array[2]
        service_hash['sub'] = line_array[3]
        service_hash['description'] = line_array[4]
        service_array.push(service_hash)
      end
    end
    service_array
  end

  def check_systemd
     unless @services.nil?
       @services.reject { |service| validate_presence_of(service) }.each do |gone|
          @crit_service << "#{gone} - Not Present"
       end
    end
    if @services.nil? && @failed == false
        critical "You must define services to check!"  
    end

    unit_services.each do |service|
      if service['active'] != 'active'
        @crit_service << "#{service['name']} - #{service['active']}"
      elsif service['sub'] != 'running'
        @crit_service << "#{service['name']} - #{service['sub']}"
      end
    end
  end

  def service_summary
    @crit_service.join(', ')
  end

  def validate_presence_of(service)
    all_service_names.include?(service)
  end

  def run
    check_systemd
    critical service_summary unless @crit_service.empty?
    ok 'All services are running'
  end
end
