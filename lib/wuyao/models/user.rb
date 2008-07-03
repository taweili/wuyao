require "wuyao/model"

module Wuyao
  class User < Model
    
    def self.elm_name
      "user"
    end
    
    def self.attr_names
      [
       :uid,
       :username,
       :online,
       :vip,
       :meili,
       :isconfirm,
       :facebig,
       :face,
       :facesmall,
       :sex,
       :nickname,
       :age,
       :prov,
       :city,
       :town,
       :hprov,
       :hcity,
       :htown,
       :study,
       :work,
       :money,
       :style,
       :blood,
       :momotext,
       :forget,
       :wish,
       :idea,
       :pay,
       :lovehistory,
       :smoke,
       :drink,
       :cloth,
       :phone,
       :linktype,
       :link
      ]
    end

    for a in attr_names
      attr_accessor a
    end
    
  end
end
