#!/usr/bin/env ruby

# file: t53.rb

# description: Uses the command-line tool tcpdump to monitor local 
#              DNS requests. Publishes the requests in real-time to 
#              a SimplePubSub broker.

require "socket"
require 'sps-pub'


class T53

  # options:
  # nic: e.g.  eth0, enp2s0f0
  #
  def initialize(nic: 'eth0', sps_host: 'spsmon', sps_port: '59053', 
                  hostname: Socket.gethostname, 
                  topic: 'dnslookup/' + hostname, debug: false, ignorelist: [])

    @nic, @host, @port, @topic, @debug = nic, sps_host, sps_port, topic, debug
    @ignorelist = ignorelist
    
  end

  def start()

    command = "sudo tcpdump -nt -i #{@nic} udp port 53"
    puts 'command: ' + command.inspect if @debug
    sps = SPSPub.new host: @host, port: @port
    ignorelist = @ignorelist
    prev_domain = ''

    IO.popen(command).each_line do |x|

      puts 'x: ' + x.inspect

      if x =~ /A\?/ then

        match = ignorelist.find {|domain| x =~ /#{domain}/ }        

        next if match 
        domain = x[/(?<=A\?\s)[^\s]+(?=\.)/]
        next if domain == prev_domain

        sps.notice "#{@topic}: " + domain
        prev_domain = domain

        sleep 0.1

      end

    end

  end

end

