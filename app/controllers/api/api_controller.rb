module Api
	class ApiController < ApplicationController
		skip_before_filter :verify_authenticity_token
		protect_from_forgery with: :null_session
		# before_filter :authenticate

		# def authenticate
		# 	authenticate_or_request_with_http_basic do |email,password|
		# 		user == "admin" && password == "admin@123"
		# 	end
		# end


	end
end