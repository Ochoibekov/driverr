class CommentssController < ApplicationController
	def index
		@comments=Comment.all
	end

	def new
    	@comment = comment.new
  	end

	def create
		@comment = comment.new(create_params)  
		if @comment.save
			redirect_to root_path
		else
			render :new
		end
	end

	private
	def create_params
    	params.require(:comment).permit(:short_desc, :long_desc)
  	end

end