class AddEstadoToSprints < ActiveRecord::Migration
  def change
    add_column :sprints, :sprint_estado, :boolean
  end
end
