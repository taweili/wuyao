require 'net/http'

module Wuyao
  class Service

    def post(params)
      Net::HTTP.post_form(url, params)
    end
    
    private
    def url
      # URI.parse('http://sandbox.api.51.com/restserver_0_1.php')
      URI.parse('http://sandbox.api.51.com/1.0/restserver.php?')
    end
  end
end
