class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action do
    handle_options_request
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
		response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
  	response.headers['Access-Control-Allow-Credentials'] = 'true'
	end

  def handle_options_request
    head(:ok) if request.request_method == "OPTIONS"
  end

end
