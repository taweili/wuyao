require "wuyao/model"

module Wuyao
  class Error < Model
    
    def self.elm_name
      "error"
    end
    
    def self.attr_names
      [
       :error_code,
       :error_msg
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
