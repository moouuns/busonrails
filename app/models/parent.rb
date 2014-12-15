class Parent < ActiveRecord::Base
	belongs_to :user

validates_presence_of :nom, :prenom, :adresse, :teldom, :telpro, :urgnom,  :urgprenom, :urgadresse, :urgteldom, :urgtelpro
end
