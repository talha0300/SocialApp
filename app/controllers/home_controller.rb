class HomeController < ApplicationController
  def index
    if user_signed_in?
      @post=Post.new
      @posts=Post.all
    end
  end

end
