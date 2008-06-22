wuyao_config = "#{RAILS_ROOT}/config/wuyao.yml"

require 'wuyao'
require "wuyao/rails/controller"
require "wuyao/session"


if File.exist?(wuyao_config)
  WUYAO = YAML.load_file(wuyao_config)[RAILS_ENV] 
  ENV['WUYAO_API_KEY'] = WUYAO['api_key']
  ENV['WUYAO_SECRET_KEY'] = WUYAO['secret_key']
  ENV['WUYAO_RELATIVE_URL_ROOT'] = WUYAO['canvas_page_name']
  ActionController::Base.asset_host = WUYAO['callback_url']
end

ActionController::Base.send(:include,Wuyao::Rails::Controller) 
