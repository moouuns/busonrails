class ParentsController < ApplicationController

	def show
		#redirect_to :dashboard
    @parent = current_user.parent

    # @enfants = # passer par current_user
	end

  def new
    # renvoie le formulaire parent
    @parent = current_user.build_parent
  end

  def create
    # créer un ENfant ds la BDD à partir du formulaire
    @parent = current_user.build_parent(parent_params)
    if @parent.save
      redirect_to parent_path(@parent.id)
    else
      redirect_to action: 'new'
    end
  end

  def edit
    # renvoie vers le formulaire de modification
  end

  def update
    # met à jour un enfant spécifique avec les données du formulaire edit
  end

  private

  def parent_params
    # white lister les params autorisés
    params.require(:parent).permit(:nom, 
                                   :prenom, 
                                   :adresse,
                                   :teldom, 
                                   :telpro, 
                                   :urgnom, 
                                   :urgprenom, 
                                   :urgadresse, 
                                   :urgteldom, 
                                   :urgtelpro)
  end

end
