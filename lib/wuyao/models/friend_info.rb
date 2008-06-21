require "wuyao/model"

module Wuyao
  class FriendInfo < Model
    
    def self.elm_name
      "friend_info"
    end
    
    def self.attr_names
      [
       :uid1,
       :uid2,
       :are_friends,
       :are_friends_reverse
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
