class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session
  before_action :authenticate, except: :handle_options_request
  after_action :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def handle_options_request
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    head :ok, :content_type => 'text/plain'
  end

  def authenticate
    #return true
    render json: {error: "unauthorized"}, status: 401  unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    #return @current_user ||= OpenStruct.new( {id: 1, admin?: false})
    if auth_present? && !auth.nil?
      if auth["business_id"]
        @current_user ||= OpenStruct.new( {id: auth["business_id"], admin?: false})
      elsif auth["admin_id"]
        @current_user ||= OpenStruct.new( {id: nil, admin_id: auth["admin_id"], admin?: true })
      end
      
    end
  end

  private
    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last
    end

    def auth
      Auth.decode(token.strip)
    end

    def auth_present?
      !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
    end
end
