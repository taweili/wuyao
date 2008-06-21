require "wuyao/model"

module Wuyao
  class Friend < Model
    
    def self.elm_name
      "friend"
    end
    
    def self.attr_names
      [
       :uid
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
