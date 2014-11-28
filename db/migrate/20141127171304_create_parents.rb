class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :nom
      t.string :prenom
      t.text :adresse
      t.string :teldom
      t.string :telpro
      t.string :urgnom
      t.string :urgprenom
      t.string :urgtel
      t.text :urgadresse
      t.string :urgteldom
      t.string :urgtelpro

      t.timestamps
    end
  end
end
