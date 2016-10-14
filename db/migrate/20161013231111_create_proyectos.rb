class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :proy_nombre
      t.text :proy_descripcion
      t.date :proy_fechainicio
      t.date :proy_fechafinalizacion
      t.string :proy_estado

      t.timestamps null: false
    end
  end
end
