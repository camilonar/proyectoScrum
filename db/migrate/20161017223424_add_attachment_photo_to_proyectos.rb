class AddAttachmentPhotoToProyectos < ActiveRecord::Migration
  def self.up
    change_table :proyectos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :proyectos, :photo
  end
end
