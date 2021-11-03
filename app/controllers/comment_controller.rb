class CommentController < ApplicationController

  def show
  end

  def new
    @gossip_id = params[:gossip_id]  
  end

  def create
    @gossip_id = params[:gossip_id]
    puts params
    @comment = Comment.new(content: params[:comment_content], user_id: params[:user], gossip_id: params[:gossip_id])
      if @comment.save
        redirect_to gossip_path(@gossip_id), success: "Commentaire validé !"
      else
        flash[:danger] = "Retente ta chance !"
        render :action => :new    
        flash.discard
      end
    end

end

def edit
  @gossip = Gossip.find(params[:gossip_id])
  @comment = Comment.find(params[:id])
end

def update
  @comment = Comment.find(params[:id])
  if @comment.update(content: params[:comment_content], user_id: params[:user])
    redirect_to gossip_path(@gossip_id), success: "Commentaire validé !"
  else
    flash[:danger] = "Retente ta chance !"
    render :action => :new    
    flash.discard
end
end


def destroy
  @gossip = Gossip.find(params[:gossip_id])
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to root_path
end

# Un commentaire peut être ajouté à un potin uniquement depuis la page show de ce dernier. La page contiendra donc un formulaire pour renseigner le texte du commentaire. Tout comme pour les potins, si un nouveau commentaire est rajouté via ce formulaire il sera assigné à notre utilisateur anonyme (pour le moment).

# La page show du gossip affichera tous les commentaires liés à ce gossip, dans l'ordre que tu veux. Pour chaque commentaire, on pourra lire son auteur (ça ne sera pas forcément ton utilisateur anonyme, tu peux aussi faire un seed avec des utilisateurs créés en base), son texte, et on disposera d'un lien pour le modifier.

# 2.5.2. Modification et destroy
# Crée la page edit du commentaire (page pour le modifier).
# Cette page permettra également de détruire le commentaire via un bouton.

# 2.5.3. Compter les commentaires
# Dans la page d'index, chaque potin affiche le nombre de commentaires qui lui sont liés.