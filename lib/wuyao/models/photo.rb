require "wuyao/model"

module Wuyao
  class Photo < Model
    
    def self.elm_name
      "photo"
    end
    
    def self.attr_names
      [
       :id,
       :pid,
       :aid,
       :url,
       :owner,
       :src_big,
       :src_small,
       :link,
       :caption,
       :description,
       :created
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
