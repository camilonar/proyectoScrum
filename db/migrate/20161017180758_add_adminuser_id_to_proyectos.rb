class AddAdminuserIdToProyectos < ActiveRecord::Migration
  def change
    add_reference :proyectos, :user, index: true, foreign_key: true
  end
end
