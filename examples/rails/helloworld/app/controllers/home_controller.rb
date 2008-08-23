class HomeController < ApplicationController
  acts_as_wuyao_controller
  
  def index
    test_method("fiveone.friends.get", :uid => "taweili")
  end
  
  def list
    # for JS only
    # test_method("fiveone.users.getLoggedInUser") 
    
    result = test_method("fiveone.friends.areFriends", :uids1 => "taweili", :uids2 => "kangtk")
    
    test_method("fiveone.friends.get", :uid => "taweili")
    
    test_method("fiveone.friends.get", :uid => "kangtk") # friend
    
    test_method("fiveone.friends.get", :uid => "vivianaxi") # stranger
    
    test_method("fiveone.photos.getHome", :uid => "taweili")
    
    test_method("fiveone.photos.getHome", :uid => "kangtk") # friend
    
    test_method("fiveone.photos.getHome", :uid => "vivianaxi") # stranger
    
    albums = test_method("fiveone.photos.getAlbums", :uid => "taweili")
    
    test_method("fiveone.photos.get", :uid => "taweili", :aid => albums[0].aid)
    
    test_method("fiveone.users.getInfo", :uid => "taweili", :fields => Wuyao::User.attr_names.join(","))

    test_method("fiveone.users.getInfo", :uids => "taweili,kangtk", :fields => Wuyao::User.attr_names.join(","))

    test_method("fiveone.homes.getInfo", :uids => "taweili", :fields => Wuyao::Home.attr_names.join(","))

    test_method("fiveone.homes.getInfo", :uids => "taweili, kangtk", :fields => Wuyao::Home.attr_names.join(","))    
    
    test_method("fiveone.homes.getInfo", :uid => "vivianaxi, taweili", :fields => Wuyao::Home.attr_names.join(","))
  end
  
  protected
  
  def test_method(method, params = { })
    ret = wuyao_session.invoke_method(method, params)
    logger.debug("------#{method} --- #{ret.inspect}")
    ret
  end

end
