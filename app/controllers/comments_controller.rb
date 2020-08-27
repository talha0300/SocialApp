class CommentsController < ApplicationController
  before_action :authenticate_user!
  def Show

  end
  def new
    @post = Post.find_by_id(params[:post_id])
  end

  def create


    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.create(comment_params)
    #do |comment|
      #comment.user_id=current_user[:id]
    #end
    #debugger
    if @comment.save
      redirect_to post_path(@post)

    else
      render "new"
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
=begin
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params) do |comment|
      comment.user = current_user
    end

  end
=end

  private
    def comment_params
      params.require(:comment).permit(:body,:post_id).merge(:user_id => current_user[:id])
    end

end
