class HomeController < ApplicationController
  def index
    if user_signed_in?
      #@post=Post.new
      @posts=Post.all.order("created_at DESC")

    end
  end

end
