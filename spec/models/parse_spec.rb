# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper.rb'
require "wuyao/parse"

describe Wuyao::Parse do

  describe "response from Users.getLoggedInUser" do
    it "should return an array of one LoggedinUserInfo" do
      result = Wuyao::Parse.new.process(users_get_logged_in_user_response_xml)
      result.size.should eql(1)
      result[0].uid.should eql("kangtk")
      result[0].token.should eql("321423534546575687")
    end
  end
  
  describe "response from Friends.areFriends" do
    it "should return an array of Users" do
      result = Wuyao::Parse.new.process(friends_are_friends_xml)
      result.size.should eql(2)
      result[0].uid1.should eql("kangtk")
      result[0].uid2.should eql("kangtk79")
      result[0].are_friends.should eql("1")
      result[0].are_friends_reverse.should eql("0")
    end
  end

  
  def users_get_logged_in_user_response_xml
    <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <users_getLoggedInUser_response xmlns="http://api.facebook.com/1.0/"  
                                      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                                      xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd"
                                      list="true">
        <loggedinuser_info>
          <uid>kangtk</uid>
          <token>321423534546575687</token>
        </loggedinuser_info>
      </users_getLoggedInUser_response>
    XML
  end
  
  def friends_are_friends_xml
    <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <friends_areFriends_response xmlns=""  xmlns:xsi=""  xsi:schemaLocation="" list="true">
	<friend_info>
	  <uid1>kangtk</uid1>
	  <uid2>kangtk79</uid2>
	  <are_friends>1</are_friends>
	  <are_friends_reverse>0</are_friends_reverse>
	</friend_info>
	<friend_info>
	  <uid1>kangtk79</uid1>
	  <uid2>kangtk</uid2>
	  <are_friends>0</are_friends>
	  <are_friends_reverse>1</are_friends_reverse>
	</friend_info>
      </friends_areFriends_response>
    XML
  end
end
