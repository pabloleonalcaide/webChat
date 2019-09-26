class ApplicationController < ActionController::API
  before_action :allow_cross_domain_ajax
  def allow_cross_domain_ajax
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = 'GET, POST, OPTIONS'
  end
  def index  
  end
end
