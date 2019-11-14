class UsersController < ApplicationController

	def create
		@user = User.new(create_params)  
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end
	def new
    	@user = User.new
  	end
  	def index
  		@users=User.all
  	end

	private
	def create_params
    	params.require(:user).permit(:mobile, :email, :password, :password_confirmation)
  	end
end