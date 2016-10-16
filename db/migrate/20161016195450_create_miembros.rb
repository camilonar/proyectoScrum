class CreateMiembros < ActiveRecord::Migration
  def change
    create_table :miembros do |t|
      t.references :user, index: true, foreign_key: true
      t.references :proyecto, index: true, foreign_key: true
      t.references :rol, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
