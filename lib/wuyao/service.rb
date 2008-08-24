require 'net/http'

module Wuyao
  class Service

    def post(params)
      Net::HTTP.post_form(url, params)
    end
    
    private
    def url
      URI.parse('http://api.51.com/1.0/restserver.php?')
    end
  end
end
