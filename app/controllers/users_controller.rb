class UsersController < ApplicationController
	def index

	end
	
	def create
		user=User.new(user_params)
		if user.save
			sessions[:user_id]=user.id
			redirect_to '/dashboard'
		else
			flash[:register_errors]=user.errors.full_messages
			redirect_to '/dashboard'
		end
	
	end

	private 
		def user_params
			params.require(:user).permit(:email,:password,:password_confirmation)
		end
end
