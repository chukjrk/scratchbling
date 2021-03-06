module Api
	module V1
		class ScratchersController < ApplicationController

			# commented out due to errors with tokens
			# before_action :authenticate_user,  only: [:auth]
			# before_action :authorize_as_admin, only: [:destroy, :create, :update, :auth]

			def auth
				render json: { status: 200, msg: "You are currently Logged-in as #{current_user.username}" }
			end

			def index
				scratchers = Scratcher.order('created_at DESC');
				render json: {status: 'SUCCESS', message: 'Loaded all', data:scratchers}, status: :ok
			end

			def show
				scratcher = Scratcher.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Item', data:scratcher}, status: :ok
			end

			def create
				scratcher = Scratcher.new(scratcher_params)

				if scratcher.save
					render json: {status: 'SUCCESS', message: 'Saved', data:scratcher}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Saving Error', data:scratcher.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				scratcher = Scratcher.find(params[:id])
				scratcher.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Item', data:scratcher}, status: :ok
			end

			def update 
				scratcher = Scratcher.find(params[:id])
				if scratcher.update_attributes(scratcher_params)
					render json: {status: 'SUCCESS', message: 'Updated Item', data:scratcher}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Update Error', data:scratcher.errors}, status: :unprocessable_entity
				end
			end

			private

			def scratcher_params
				params.permit(:title, :description, :size, :price)
			end
		end
	end
end