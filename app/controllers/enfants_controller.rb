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
    @enfant = Enfant.find(params[:id])

  end

  def update
    @enfant = Enfant.find(params[:id])
    if @enfant.update(enfant_params)
      redirect_to parent_path(current_user.parent.id)
    else
      redirect_to edit_enfant_path(@enfant)
    end
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