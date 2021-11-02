class GossipController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new

  @gossip = Gossip.new
    
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    # @gossip = Gossip.find(params[:id])
  end

  def create
  # gossip = Gossip.create(title: params[:gossip_title], content: params[:gossip_content], user_id: params[:user])
  # redirect_to gossip_path(gossip.id)
  puts params
  @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content])
  @gossip.save
  #redirect_to @gossip
  
end

end
