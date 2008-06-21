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
    it "should return an array of two FriendInfo" do
      result = Wuyao::Parse.new.process(friends_are_friends_xml)
      result.size.should eql(2)
      result[0].uid1.should eql("kangtk")
      result[0].uid2.should eql("kangtk79")
      result[0].are_friends.should eql("1")
      result[0].are_friends_reverse.should eql("0")
    end
  end
  
  describe "response from friends.get" do
    it "should return an array of two Friend" do
      result = Wuyao::Parse.new.process(friends_get_response_xml)
      result.size.should eql(2)
      result[0].uid.should eql("kangtk79")
      result[1].uid.should eql("ekangtk")
    end
  end
  
  describe "response from Photos.getHome" do
    it "should return an array of two Photo" do
      result = Wuyao::Parse.new.process(photos_get_home_response_xml)
      result.size.should eql(2)
      result[0].id.should eql("100058274")
      result[0].url.should eql("http://images18.51.com/1001/c/ce/25/kangtk/1201492196_99914700.jpg")
    end
  end
  
  
  def photos_get_home_response_xml
    <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <photos_getHome_response xmlns=""  xmlns:xsi=""  xsi:schemaLocation="" list="true">
	<photo>
	  <id>100058274</id>
	  <url>http://images18.51.com/1001/c/ce/25/kangtk/1201492196_99914700.jpg</url>
	</photo>
	<photo>
	  <id>100058149</id>
	  <url>http://images18.51.com/1002/a/ce/25/kangtk/1201333915_77163700.jpg</url>
	</photo>
      </photos_getHome_response>
    XML
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
  
  def friends_get_response_xml
    <<-XML
      <?xml version="1.0" encoding="UTF-8"?>
      <friends_get_response xmlns=""  xmlns:xsi=""  xsi:schemaLocation="" list="true">
	<friend>
	  <uid>kangtk79</uid>
	</friend>
	<friend>
	  <uid>ekangtk</uid>
	</friend>
      </friends_get_response>
    XML
  end
end
