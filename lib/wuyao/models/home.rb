require "wuyao/model"

module Wuyao
  class Home < Model
    
    def self.elm_name
      "home"
    end
    
    def self.attr_names
      [
       :uid,
       :title,
       :music
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
