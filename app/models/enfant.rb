class Enfant < ActiveRecord::Base 
	belongs_to :user

  validates_presence_of :nomenfant, :prenomenfant, :datenaissance, :ecole, :classe
end
