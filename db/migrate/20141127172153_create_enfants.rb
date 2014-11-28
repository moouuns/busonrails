class CreateEnfants < ActiveRecord::Migration
  def change
    create_table :enfants do |t|
      t.string :nomenfant
      t.string :prenomenfant
      t.string :datenaissance
      t.string :ecole
      t.string :classe

      t.timestamps
    end
  end
end
