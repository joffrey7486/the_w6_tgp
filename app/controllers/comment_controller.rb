class CommentController < ApplicationController

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    puts params
    @comment = Comment.new(content: params[:comment_content], user_id: params[:user], gossip_id: params[:gossip_id])
      if @comment.save
        redirect_to gossip_path(params[:gossip_id]), success: "Commentaire validé !"
      else
        flash[:danger] = "Retente ta chance !"
        render :action => :new    
        flash.discard
      end
    end

  def edit     
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:comment_content], user_id: params[:user])
      redirect_to gossip_path(params[:gossip_id]), success: "Commentaire validé !"
    else
      flash[:danger] = "Retente ta chance !"
      render :action => :new    
      flash.discard
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(params[:gossip_id])
  end

end