class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_like, only: [:destroy]



  def create
    session[:return_to] ||= request.referer
    @post = Post.find(params[:post_id])
    @post.likes.create(user: current_user, post: @post)
    @like = @post.likes.where(user: current_user, post: @post).first

    respond_to do |format|
      format.js
      #format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      #format.json { head :no_content }
    end
    if @post[:user_id] != current_user.id
      Notification.create_notification(user_id:@post.user.id,actor_id:current_user.id,notification_type:params[:controller],target_type:"posts",target_id:@post[:id])

    end



  end

  def destroy


    @like.destroy
    respond_to do |format|
      format.js
    
    end


  end

  private
    def like_params
      params.permit(:post_id)
    end
    def find_like
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
    end
end
