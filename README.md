# Introducing the T53 gem

The T53 gem use the command-line tool **tcpdump** to output the DNS requests from the local machine.

## Running the SPS broker

    require 'simplepubsub'

    SimplePubSub::Broker.start port: '59053'


## Running the T53 gem

    require 't53'

    t53 = T53.new nic: 'enp2s0f0', sps_host: '127.0.0.1', debug: true, 
                  ignorelist: ['jamesrobertson.eu']
    t53.start

## Running the SPS subscriber

    require 'sps-sub'

    sps = SPSSub.new(host: '127.0.0.1', port: '59053')
    sps.subscribe(topic: '#') do |msg|
      puts 'msg: ' + msg.inspect
    end


## Observed

<pre>
msg: "duckduckgo.com"
msg: "www.edinburghnews.scotsman.com"
msg: "nexus.ensighten.com"
msg: "data.de.coremetrics.com"
msg: "tagger.opecloud.com"
msg: "ad.crwdcntrl.net"
msg: "visitanalytics.userreport.com"
msg: "sb.scorecardresearch.com"
msg: "adservice.google.co.uk"
msg: "ping.chartbeat.net"
msg: "tmscdn.de.coremetrics.com"
msg: "res.cloudinary.com"
msg: "johnston.grapeshot.co.uk"
msg: "js-sec.indexww.com"
msg: "l.betrad.com"
msg: "yield-manager.browsiprod.com"
msg: "p.typekit.net"
msg: "fonts.googleapis.com"
msg: "cdn.dynamicyield.com"
msg: "editorial.jpress.co.uk"
</pre>

## Resources

* Monitoring DNS traffic using tcpdump http://www.jamesrobertson.eu/clf/2018/aug/25/monitoring-dns-traffic-using-tcpdump.html
* t53 https://rubygems.org/gems/t53

t53 gem dns sniffer tcpdump capture packets linux debian
