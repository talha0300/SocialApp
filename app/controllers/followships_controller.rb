class FollowshipsController < ApplicationController
  def create
    @followship= current_user.followships.build(followee_id: params[:followee_id],accepted: false)
    if @followship.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to users_path
    end
  end

  def destroy
    @followship= Followship.find_by_id(params[:id])
    @followship.destroy
    respond_to do |format|
      format.js
    end
  end


  def update
    @followship=Followship.find_by_id(params[:id])
    @followship.update(accepted:true)
    respond_to do |format|
      format.js
    end
  end


end
