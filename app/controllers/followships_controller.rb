class FollowshipsController < ApplicationController
  def create
    @followship= Followship.new(params[:followship])
    if @followship.save
      redirect_to root_path
    end
  end

  def destroy
    @followship= Followship.find(params[:id])
    if @followship.destroy
      redirect_to root_path
    end
  end


end
