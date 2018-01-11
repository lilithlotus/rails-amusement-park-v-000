class RidesController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    redirect_to user_path(@user)
  end

  def show
    @ride = Ride.find(params[:id])
  end
end
