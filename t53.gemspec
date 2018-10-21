Gem::Specification.new do |s|
  s.name = 't53'
  s.version = '0.1.0'
  s.summary = 'Uses the command-line tool tcpdump to monitor local ' +
              'DNS requests. Publishes the requests in real-time to ' +
              'a SimplePubSub broker.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/t53.rb']
  s.add_runtime_dependency('sps-pub', '~> 0.5', '>=0.5.5') 
  s.signing_key = '../privatekeys/t53.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/t53'
end
