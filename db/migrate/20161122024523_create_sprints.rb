class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.text :sprint_nombre
      t.date :sprint_fechainicio
      t.date :sprint_fechafinalizacion
      t.references :proyecto, index: true, foreign_key: true
    
      t.timestamps null: false
    end
  end
end
