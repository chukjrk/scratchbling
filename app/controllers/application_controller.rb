class ApplicationController < ActionController::API
	def not_found
		render json: { error: 'not_found' }
	end

	def authorize_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  @decoded = JsonWebToken.decode(header)
		  @current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
		  render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
		  render json: { errors: e.message }, status: :unauthorized
		end
	end

	protected

	def authorize_as_admin
		return_unauthorized unless !current_user.nil? && current_user.is_admin?
	end
end
