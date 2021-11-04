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

  def edit
    @gossip = Gossip.find(params[:id])
    @comment = Comment.find_by(gossip_id: params[:id])
  end

  def update
    @comment = Comment.find_by(gossip_id: params[:id])
    if @comment.update(content: params[:comment_content], user_id: params[:user])
      redirect_to gossip_path(params[:id]), success: "Commentaire validé !"
    else
      flash[:danger] = "Retente ta chance !"
      render :action => :new    
      flash.discard
    end
  end

  def destroy
    @comment = Comment.find_by(gossip_id: params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:id])
  end

end