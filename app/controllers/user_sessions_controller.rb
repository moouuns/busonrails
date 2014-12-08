class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      if @user.enfants.count == 0
        redirect_back_or_to(new_enfant_path, notice: 'Vous êtes connecté')
      elsif @user.parent.count == 0
        redirect_back_or_to(new_parent_path, notice: 'Vous êtes connecté')
      else 
        redirect_back_or_to(parent_path(@user.parent.id), notice: 'Vous êtes connecté')
      end
        
    else
      flash.now[:alert] = "Erreur d'identification"
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Vous êtes déconnecté')
  end
end