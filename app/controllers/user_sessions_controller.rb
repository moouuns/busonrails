# app/controllers/user_sessions_controller.rb
class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(new_enfant_path, notice: 'Vous êtes connecté')
    else
      flash.now[:alert] = "Erreur d'identification"
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:index, notice: 'Vous êtes déconnecté')
  end
end