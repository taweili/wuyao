wuyao_config = "#{RAILS_ROOT}/config/wuyao.yml"

require 'wuyao'
require "wuyao/rails/controller"
require "wuyao/rails/wuyao_url_rewrite"
require "wuyao/session"

if File.exist?(wuyao_config)
  WUYAO = YAML.load_file(wuyao_config)[RAILS_ENV] 
  ENV['WUYAO_API_KEY'] = WUYAO['api_key']
  ENV['WUYAO_SECRET_KEY'] = WUYAO['secret_key']
  ENV['WUYAO_RELATIVE_URL_ROOT'] = WUYAO['canvas_page_name']
  ActionController::Base.asset_host = WUYAO['callback_url']
end

ActionController::Base.send(:include,Wuyao::Rails::Controller) 

class ActionController::Routing::Route
  def recognition_conditions_with_wuyao
    defaults = recognition_conditions_without_wuyao 
    defaults << " env[:canvas] == conditions[:canvas] " if conditions[:canvas]
    defaults
  end
  alias_method_chain :recognition_conditions, :wuyao
end

# We turn off route optimization to make named routes use our code for figuring out if they should go to the session
# If this fails, it means we're on rails 1.2, we can ignore it
begin
  ActionController::Base::optimise_named_routes = false 
rescue NoMethodError=>e
  nil
end

# pull :canvas=> into env in routing to allow for conditions
ActionController::Routing::RouteSet.send :include,  Wuyao::Rails::Routing::RouteSetExtensions
ActionController::Routing::RouteSet::Mapper.send :include, Wuyao::Rails::Routing::MapperExtensions

