class EnfantsController < ApplicationController

  def check_id
    if @enfant = enfant.find(params[:id])
      redirect_to enfant_path
  end

  def new
    # renvoie le formulaire enfant
    @enfant = Enfant.new
  end

  def create
    # créer un ENfant ds la BDD à partir du formulaire
		redirect_to new_parent_path
  end

  def edit
    # renvoie vers le formulaire de modification

  end

  def update
    # met à jour un enfant spécifique avec les données du formulaire edit
  end
	
end