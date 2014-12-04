class AddUserRefToParentsAndEnfants < ActiveRecord::Migration
  def change
    add_column :enfants, :user_id, :integer
    add_column :parents, :user_id, :integer
  end
end
