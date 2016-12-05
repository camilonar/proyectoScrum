class CreateTarea < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.string :Asunto
      t.string :Descripcion
      t.string :Estado
      t.integer :Estimacion
      t.references :sprint, index: true, foreign_key: true
      t.references :historiausuario, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
