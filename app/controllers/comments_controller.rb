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

    if @comment.save
      if @post[:user_id] != current_user.id
        @notification=Notification.new(user_id:@post.user.id,actor_id:current_user.id,notification_type:params[:controller],target_type:"posts",target_id:@post[:id])
        @notification.save
      end
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


  private
    def comment_params
      params.require(:comment).permit(:body,:post_id).merge(:user_id => current_user[:id])
    end

end
