$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "wuyao/models/loggedin_user_info"
require "wuyao/models/friend_info"
require "wuyao/models/friend"
require "wuyao/models/photo"
require "wuyao/models/album"
require "wuyao/models/user"
require "wuyao/models/home"
require "wuyao/models/error"

module Wuyao
  class << self 
    def canvas_path
      ENV['WUYAO_RELATIVE_URL_ROOT'] 
    end
    
    def canvas_server_base
      "apps.51.com"
    end
    
    def wuyao_path_prefix
      "/" + canvas_path
    end
    
    def path_prefix
      @path_prefix
    end
    
    def request_for_canvas(is_canvas_request)
      original_path_prefix = @path_prefix 
      begin
        @path_prefix = wuyao_path_prefix if is_canvas_request
        yield
      ensure
        @path_prefix = original_path_prefix
      end
    end
  end
end
