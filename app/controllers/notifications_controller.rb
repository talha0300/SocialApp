class NotificationsController < ApplicationController


  def index
    @notifications=current_user.notifications
    
  end

  def show

  end


  def create

  end
end
