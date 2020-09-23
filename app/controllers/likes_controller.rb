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

    end
    if @post[:user_id] != current_user.id
      Notification.notifications_creator(post:@post,params:params,type:"post",actor:current_user)


    end



  end

  def destroy

    if @like
      @like.destroy
      respond_to do |format|
        format.js

      end
    else
      not_found
    end

  end

  private
    def like_params
      params.permit(:post_id)
    end
    def find_like
      @post = Post.find(params[:post_id])
      if @post
        @like = @post.likes.find(params[:id])
      else
        not_found
      end
    end
end
