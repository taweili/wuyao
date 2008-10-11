module ::ActionController
  class AbstractRequest                         
    def relative_url_root
      Wuyao.path_prefix
    end                                         
  end
  
  class UrlRewriter
    RESERVED_OPTIONS << :canvas

    def link_to_canvas?(params, options)
      option_override = options[:canvas]
      return false if option_override == false # important to check for false. nil should use default behavior
      option_override || @request.parameters["51_sig_in_canvas"] == "1"
    end
  
    def rewrite_url_with_wuyao(*args)
      options = args.first.is_a?(Hash) ? args.first : args.last
      is_link_to_canvas = link_to_canvas?(@request.request_parameters, options)
      if is_link_to_canvas && !options.has_key?(:host) 
        options[:host] = Wuyao.canvas_server_base
      end 
      options.delete(:canvas)

      Wuyao.request_for_canvas(is_link_to_canvas) do
        rewrite_url_without_wuyao(*args)
      end
    end
    
    alias_method_chain :rewrite_url, :wuyao
  end
end
