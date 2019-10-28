class DriversController < ApplicationController
	def index
		@drivers=Driver.all
	end

	def new
    	@driver = Driver.new
  	end

	def create
		@driver = Driver.new(create_params)  
		if @driver.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@driver = Driver.find(params[:id])
		@comments = Comment.all
	end

	def comment_new
		@comment = Comment.new
		@driver=Driver.find(params[:id])
		@comment.driver_id = @driver.id
	end

	def comment_create
		@user = current_user
		@comment = Comment.new(comment_create_params)
		if @comment.save
			redirect_to root_path
		else
			render :comment_new
		end
	end

	private
	def create_params
    	params.require(:driver).permit(:pin, :passport_number, :passport_series)
  	end
  	def comment_create_params
    	params.require(:comment).permit(:short_desc, :long_desc, :driver_id, :user_id)
  	end

end