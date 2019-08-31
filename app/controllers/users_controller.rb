class UsersController < ApplicationController

  before_action :authorize_request, except: :create
  before_action :authenticate_user,  only: [:index, :current, :update]
  before_action :authorize_as_admin, only: [:destroy]
  before_action :authorize,          only: [:update]
  
  def index
    users = User.all
    render json: {msg: 'Logged-in'}, status: :ok
  end
  
  # return the user's logged-in information.
  def current
    current_user.update!(last_login: Time.now)
    render json: current_user
  end

  def show
    render json: @user, status: :ok
  end
  
  def create
	  user = User.new(user_params)
	  if user.save
	    render json: {msg: 'User created.'}, status: :created
    else
      render json: { errors: user.errors.full_messages },status: :unprocessable_entity
	  end
	end

	def update
	  user = User.find(params[:id])
	  if user.update(user_params)
	    render json: { msg: 'User has been updated.' }, status: :unprocessable_entity
	  end
	end

	def destroy
	  user = User.find(params[:id])
    user.destroy
	  if user.destroy
	    render json: { status: 200, msg: 'User has been deleted.' }
	  end
	end

  private
  
  def user_params
    params.require(:user).permit(:name, :password, :email, :role)
  end
  
  # checks to see if current_user can update itself. 
  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end
end
