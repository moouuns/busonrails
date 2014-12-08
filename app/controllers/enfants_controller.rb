class EnfantsController < ApplicationController

  def new
    # renvoie le formulaire enfant
    @enfant = Enfant.new
  end

  def create
    # créer un ENfant ds la BDD à partir du formulaire
		@enfant = current_user.enfants.new(enfant_params)
    if @enfant.save
      redirect_to new_parent_path
    else
      redirect_to new_enfant_path
    end
  
  end

  def edit
    # renvoie vers le formulaire de modification
  end

  def update
    # met à jour un enfant spécifique avec les données du formulaire edit
  end

  private

  def enfant_params
    params.require(:enfant).permit(:nomenfant,
                                  :prenomenfant,
                                  :datenaissance,
                                  :ecole,
                                  :classe)
  end
	
end