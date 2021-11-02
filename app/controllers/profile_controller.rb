class ProfileController < ApplicationController
  def show
    @author = User.find(params[:id])
    @gossips = Gossip.where(user_id: params[:id])
  end
end
