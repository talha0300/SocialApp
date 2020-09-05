class FollowshipsController < ApplicationController
  def create
    @followship= current_user.followships.build(followee_id: params[:followee_id],accepted: false)
    if @followship.save
      respond_to do |format|
        format.js
      end
      Notification.create_notification(user_id:@followship.followee_id,actor_id:@followship.user_id,notification_type:params[:controller],target_type:"follow",target_id:@followship.followee_id)

    else
      redirect_to users_path
    end
  end

  def destroy
    @followship= Followship.find_by_id(params[:id])
    if @followship.destroy
      respond_to do |format|
        format.js
      end
      if @followship.user_id != current_user.id
        Notification.create_notification(user_id:@followship.user_id,actor_id:@followship.followee_id,notification_type:params[:controller],target_type:"unfollow",target_id:@followship.followee_id)

      elsif @followship.user_id === current_user.id && @followship.accepted
        Notification.create_notification(user_id:@followship.followee_id,actor_id:@followship.user_id,notification_type:params[:controller],target_type:"unfollow",target_id:@followship.followee_id)

      end
    else
      redirect_to current_user
    end
  end


  def update
    @followship=Followship.find_by_id(params[:id])
    if @followship.update(accepted:true)
      respond_to do |format|
        format.js
      end
      Notification.create_notification(user_id:@followship.user_id,actor_id:@followship.followee_id,notification_type:params[:controller],target_type:"follow_acceptance",target_id:@followship.followee_id)
      
    else
      redirect_to current_user
    end
  end


end
