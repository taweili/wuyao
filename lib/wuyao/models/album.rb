require "wuyao/model"

module Wuyao
  class Album < Model
    
    def self.elm_name
      "album"
    end
    
    def self.attr_names
      [
       :aid,
       :name,
       :status
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
