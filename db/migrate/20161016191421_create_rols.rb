class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|
      t.text :rol_nombre
      t.timestamps null: false
    end
  end
end
