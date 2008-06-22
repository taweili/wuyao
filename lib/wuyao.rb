$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "wuyao/models/loggedin_user_info"
require "wuyao/models/friend_info"
require "wuyao/models/friend"
require "wuyao/models/photo"
require "wuyao/models/album"
require "wuyao/models/user"
require "wuyao/models/home"

module Wuyao
  
end
