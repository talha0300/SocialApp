class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_like, only: [:destroy]



  def create
    session[:return_to] ||= request.referer
    @post = Post.find(params[:post_id])
    #@like = @post.likes.find(params[:id])
    if @post.likes.where(user: current_user.id).present?
        flash[:error] = "You've already upvoted this!"
    elsif @post.likes.create(user: current_user, post: @post)
        flash[:success] = "Upvoted!"
    else
        flash[:error] = "An error prevented you from upvoting."
    end
    @like = @post.likes.where(user: current_user, post: @post)[0]
    #debugger
    respond_to do |format|
      format.js
      #format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      #format.json { head :no_content }
    end

    #redirect_to session.delete(:return_to)

  end

  def destroy
    #session[:return_to] ||= request.referer

    @like.destroy
    respond_to do |format|
      format.js
      #format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      #format.json { head :no_content }
    end
    #redirect_to session.delete(:return_to)
    #redirect_to post_path(@post)
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
