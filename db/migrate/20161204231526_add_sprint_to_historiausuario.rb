class AddSprintToHistoriausuario < ActiveRecord::Migration
  def change
    add_reference :historiausuarios, :sprint, index: true, foreign_key: true
  end
end
