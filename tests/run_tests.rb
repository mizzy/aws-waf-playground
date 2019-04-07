#!/usr/bin/env ruby

require 'yaml'
require 'uri'
require 'net/http'
require 'json'

dir = __dir__

tests = YAML.load_file(File.join(dir, 'tests.yaml'))

lb_dns_name = ''
Dir.chdir(File.join(dir, '..', 'terraform')) do
  lb_dns_name = `terraform output lb_dns_name`.chomp
end

uri = URI.parse(sprintf("http://%s", lb_dns_name))
http = Net::HTTP.new(uri.host, uri.port)
  
tests.each do |test|
  req = Net::HTTP::Post.new(uri.request_uri)
  req['Content-Type'] = 'application/json'
  req.body = test['req']['body'].to_json
  
  res = http.request(req)

  if res.code != test['res']['status'].to_s
    abort(
      sprintf('Test %s should get status code %s, but %s',
      test['name'],
      test['res']['status'],
      res.code)
    )
  end
end

