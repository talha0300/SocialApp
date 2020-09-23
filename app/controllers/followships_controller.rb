class FollowshipsController < ApplicationController
  def create
    @followship= current_user.followships.build(followee_id: params[:followee_id],accepted: false)
    if @followship.save
      respond_to do |format|
        format.js
      end

      Notification.notifications_creator(followship:@followship,params:params,type:"reverse_followship")

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
        Notification.notifications_creator(followship:@followship,params:params,type:"followship")


      elsif @followship.user_id === current_user.id && @followship.accepted
        Notification.notifications_creator(followship:@followship,params:params,type:"reverse_followship")


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
      Notification.notifications_creator(followship:@followship,params:params,type:"followship")
      

    else
      redirect_to current_user
    end
  end


end
