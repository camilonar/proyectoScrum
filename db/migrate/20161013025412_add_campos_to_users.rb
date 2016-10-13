class AddCamposToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :apodo, :string,	null: true 
  end
end
