# frozen_string_literal: true

class GossipController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.where(gossip_id: params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    puts params
    @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: params[:user])
    if @gossip.save
      redirect_to gossip_path(@gossip.id), success: 'Gossip validé !'
    else
      flash.now[:danger] = 'Retente ta chance !'
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip_title], content: params[:gossip_content], user_id: params[:user])
      redirect_to gossip_path(@gossip.id), success: 'Gossip validé !'
    else
      flash[:danger] = 'Retente ta chance !'
      render :edit, status: :unprocessable_entity
      flash.discard
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
end
