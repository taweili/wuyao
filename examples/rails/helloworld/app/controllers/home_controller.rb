class HomeController < ApplicationController
  acts_as_wuyao_controller
  
  def index
    # for JS only
    # test_method("fiveone.users.getLoggedInUser") 
    
#      for attr in Wuyao::User.attr_names - [:uid]
#        logger.debug("##### #{attr} #####")
#        test_method("fiveone.users.getInfo", :uid => "taweili", :fields => [attr].join(","))
#      end

#     test_method("fiveone.users.getInfo", :uid => "taweili", :fields => (Wuyao::User.attr_names - [:uid, :study, :online, :phone, :linktype, :link]).join(","))
    
#    test_method("fiveone.users.getInfo", :uid => "taweili", :fields => [:username, :nickname].join(","))
    
#    test_method("fiveone.users.invite", :invites => "taweili", :reason => CGI::escape(Base64.encode64("test")))

#    test_method("fiveone.users.invite", :invites => "taweili", :reason => "test")
    
#     test_method("fiveone.users.leaveMsg", :receiver => "tuxedoking", :message => "test", :hidden => "1")
    
#     test_method("fiveone.users.leaveMsg", :receiver => "kangtk", :message => "test", :hidden => "1")

#     test_method("fiveone.users.leaveMsg", :receiver => "taweili", :message => "test", :hidden => "1")
    
#    result = test_method("fiveone.friends.areFriends", :uids1 => "taweili", :uids2 => "kangtk")
    
#    result = test_method("fiveone.friends.areFriends", :uids1 => "taweili", :uids2 => "kangtk")
    
#    result = test_method("fiveone.friends.getAppUsers", :uids1 => "taweili", :uids2 => "kangtk")
    
#    test_method("fiveone.friends.get", :uid => "taweili")
    
#     test_method("fiveone.friends.get", :uid => "kangtk") # friend
    
#     test_method("fiveone.friends.get", :uid => "vivianaxi") # stranger
    
#    test_method("fiveone.photos.getHome", :uid => "taweili")
    
#     test_method("fiveone.photos.getHome", :uid => "kangtk") # friend
    
#     test_method("fiveone.photos.getHome", :uid => "vivianaxi") # stranger
    
#     albums = test_method("fiveone.photos.getAlbums", :uid => "taweili")
    
#     test_method("fiveone.photos.get", :uid => "taweili", :aid => albums[0].aid)
    
#     test_method("fiveone.users.getInfo", :uid => "taweili", :fields => Wuyao::User.attr_names.join(","))

#     test_method("fiveone.users.getInfo", :uids => "taweili,kangtk", :fields => Wuyao::User.attr_names.join(","))

#     test_method("fiveone.homes.getInfo", :uids => "taweili", :fields => Wuyao::Home.attr_names.join(","))

#     test_method("fiveone.homes.getInfo", :uids => "taweili, kangtk", :fields => Wuyao::Home.attr_names.join(","))    
    
#     test_method("fiveone.homes.getInfo", :uid => "vivianaxi, taweili", :fields => Wuyao::Home.attr_names.join(","))
    
    
  end
  
  protected
  
  def test_method(method, params = { })
    ret = wuyao_session.invoke_method(method, params)
    logger.debug("------#{method} --- #{ret.inspect}")
    ret
  end

end
