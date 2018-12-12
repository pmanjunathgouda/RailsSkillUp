class PostsController < ApplicationController
	#Calling actions before induvidual action is called
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	#Checking for user authentication 
	#if not loged in then no action display will be show
	before_action :authenticate_user!
	#FOr listing posts
  #A method list all the post
	def index
    @posts = Post.all
    # Formating result to get in the form CSV 
    respond_to do |format|
    	format.html
      #used to get result in CSV format(CSV file download)
    	format.csv { send_data @posts.to_csv }
    end
  end 

	#def show
  # @posts = Post.find(params[:id])
  #end

 	#Creating new post
	def new
		@posts = Post.new
	end

	#def edit
  # @posts = Post.find(params[:id])
	#end

	#Creating new post
	def create
		#Directly assign the post to logged in user
  		@posts =  current_user.posts.new(post_params)
    #displaying alert message after creating new post
 		if @posts.save
  		redirect_to posts_path, notice: 'Post was successfully created.'
  	else #if creating new post fails
    	render 'new'
  	end
  end

  #Updatation action
  def update
		# @posts = Post.find(params[:id])
 		if @posts.update(post_params)
    	redirect_to posts_path, notice: 'Post was successfully updated.'
  	else
    	render 'edit'
  	end
	end
  
	#delete action
	def destroy
  		# @posts = Post.find(params[:id])
  		if @posts.destroy
 			redirect_to posts_index_path, notice: 'Post was successfully Deleted.'
 		end
	end
  	private
  		def post_params
    		params.require(:post).permit(:title, :description, :attachment)
  		end
  		def find_post
        	@posts = Post.find(params[:id])
    	end
end

