class Sprint < ActiveRecord::Base
	belongs_to :proyecto
	has_many :tareas , :dependent => :delete_all
	has_many :historiausuarios  
end
