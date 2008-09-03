require 'pp'
module Wuyao
  class Session
    attr_accessor :auth_token
    attr_reader :session_key
    attr_reader :expires
    attr_reader :user
    attr_reader :time
    attr_reader :api_key
    attr_reader :in_iframe
    attr_reader :added

    DEBUG = false
    
    def initialize(params)
      if params["51_sig_session_key"]
        @expires = params["51_sig_expires"] == "1"
        @session_key = params["51_sig_session_key"]
        @user = params["51_sig_user"]
        @time = params["51_sig_time"]
        @api_key = params["51_sig_app_key"]
        @in_iframe = params["51_sig_in_iframe"] == "1"
        @added = params["51_sig_added"] == "1"
      end
    end
    
    def invoke_method(method, params = {})
      wuyao_params = { 
        :user => user,
        :method => method,
        :app_key => api_key,
        :session_key => session_key,
        :time => time,
        :version => "1.2",
        :sdk_from => "php"
      }
      wuyao_params.merge!(params) if params

      tmp_params = { }
      wuyao_params.each { |k,v| tmp_params[k.to_s] = v }
      wuyao_params = tmp_params
      str = (wuyao_params.sort.collect { |c| "#{c[0]}=#{c[1]}" }).join("") + ENV['WUYAO_SECRET_KEY']

      pp("str = #{str}") if DEBUG

      sig = Digest::MD5.hexdigest(str)
      
      tmp_params = { }
      wuyao_params.each { |k,v| tmp_params["51_sig_#{k.to_s}"] = v }
      wuyao_params = tmp_params
      
      wuyao_params["51_sig"] = sig
      
      pp("wuyao_params = #{wuyao_params.inspect}") if DEBUG

      Parse.new.process(Service.new.post(wuyao_params).body)
    end
    
  end
end
