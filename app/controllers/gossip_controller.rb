class GossipController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
  puts params
  @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: params[:user])
  if @gossip.save
    redirect_to gossip_path(@gossip.id)
  else
    redirect_to new_gossip_path
  end
end

end
