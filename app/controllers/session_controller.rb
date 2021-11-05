class SessionController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new
  end

  def create
    user = User.find_by(email: params[:user_email])

    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      # on va cuisiner le cookie pour l'utilisateur
      remember(user)
      redirect_to root_path, success: 'Bienvenue !'

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    current_user = User.find_by(id: session[:user_id])
    log_out(current_user)
    redirect_to root_path
  end
end
