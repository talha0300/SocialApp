class HomeController < ApplicationController
  def index
    if user_signed_in?
      
      @posts=Post.all.order("created_at DESC")

    end
  end

end
