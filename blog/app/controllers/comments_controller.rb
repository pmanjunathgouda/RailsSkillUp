class CommentsController < ApplicationController
  #A method to create new comments
	def create
    #creating instance of Post calss to create association between
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    #redirect to Post view after create
    redirect_to post_path(@post)
  end
 	#a method to delete comment(This only permitted to Admin User) 
 	def destroy
    #creating Post class instance to get Post id
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    #deleting comment related to fetched post
    @comment.destroy
    #redirect to Post view page after delete
    redirect_to post_path(@post)
  end 
  #A private method to get parameters of comments module
  private
    def comment_params
      #parameters value recived from comments new/edit form 
      params.require(:comment).permit(:commenter, :body)
    end
end
