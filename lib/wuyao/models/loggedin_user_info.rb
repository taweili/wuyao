require "wuyao/model"

module Wuyao
  class LoggedinUserInfo < Model
    
    def self.elm_name
      "loggedinuser_info"
    end
    
    def self.attr_names
      [
       :uid,
       :token
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
