class CommentsController < ApplicationController
  before_action :authenticate_user!
  def Show

  end
  def new
    @post = Post.find_by_id(params[:post_id])
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    if @post
      @comment = @post.comments.create(comment_params)
      if @comment.save
        redirect_to post_path(@post)

      else
        render "new"
      end
    else
      not_found
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
      #format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      #format.json { head :no_content }
    end
    #redirect_to post_path(@post)
  end


  private
    def comment_params
      params.require(:comment).permit(:body,:post_id).merge(:user_id => current_user[:id])
    end

end
