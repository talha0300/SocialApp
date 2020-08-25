class CommentsController < ApplicationController
  def Show

  end
  def new
    @post = Post.find_by_id(params[:post_id])
  end

  def create

    p "here is there"
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params) do |comment|
      comment.user_id=current_user[:id]
    end
    #debugger
    if @comment.save
      redirect_to post_path(@post)
    end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
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
      params.require(:comment).permit(:body,:user_id,:post_id)
    end

end
