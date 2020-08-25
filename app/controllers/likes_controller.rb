class LikesController < ApplicationController
  before_action :authenticate_user!


=begin
  def create
    @post = Post.find(params[:post_id])
    #debugger
    @like = @post.likes.create(like_params) do |like|
      like.user_id=current_user[:id]
    end
    #debugger
    if @like.save
      redirect_to root_path
    end

  end
=end

  def create
    @post = Post.find(params[:post_id])
    if @post.likes.where(user: current_user.id).present?
        flash[:error] = "You've already upvoted this!"
    elsif @post.likes.create(user: current_user, post: @post)
        flash[:success] = "Upvoted!"
    else
        flash[:error] = "An error prevented you from upvoting."
    end
    redirect_to root_path
  end

  private
    def like_params
      params.permit(:post_id)
    end
end
