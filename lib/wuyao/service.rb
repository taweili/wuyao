require 'net/http'
require 'pp'

module Wuyao
  class Service
    DEBUG = true
    def post(params)
      pp "params: #{params.inspect}" if DEBUG
      res = Net::HTTP.post_form(url, params)
      pp "res: #{res.inspect}" if DEBUG
      pp "res.body: #{res.body}" if DEBUG
      res
    end
    
    private
    def url
      #URI.parse('http://sandbox.api.51.com/1.0/restserver.php')
      URI.parse('http://api.51.com/1.0/restserver.php')
    end
  end
end
