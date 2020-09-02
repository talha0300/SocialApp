class NotificationsController < ApplicationController


  def index
    @notifications=current_user.notifications.order("created_at DESC")

  end

  def show
    @notification=current_user.notifications.find(params[:id])
  end

  def destroy
    @notification=Notification.find_by_id(params[:id])
    if @notification.destroy
      respond_to do |format|
        format.js
      end
    else
      redirect_to notifications_path
    end
  end

end
