class HomeController < ApplicationController
  def index
    if user_signed_in?
      @post=Post.new
      @posts=Post.all
=begin
      @posts.each do |post|
        check=post.likes.where("user_id=#{current_user[:id]}")
        if check
          post[:liked]=true
        else
          post[:liked]=false
        end
        debugger
      end
=end

    end
  end

end
