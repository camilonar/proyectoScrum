class CreateHistoriausuarios < ActiveRecord::Migration
  def change
    create_table :historiausuarios do |t|
      t.string :His_Nombre
      t.text :His_Descripcion
      t.integer :His_Prioridad
      t.integer :His_Esfuerzo
      t.references :proyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
