class Proyecto < ActiveRecord::Base
	belongs_to :user
	has_many :miembros, :dependent => :delete_all
	has_many :sprints, :dependent => :delete_all
	has_many :historiausuarios, :dependent => :delete_all
	
	has_attached_file :photo
	#validates_attachment :photo, dimensions: { height: 30, width: 30 }
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]




	after_initialize do
  		if self.new_record?
    	# values will be available for new record forms.
   			 if (self.proy_estado==nil)
   		 		self.proy_estado = 'Abierto' 
   		 	end
  		end
	end

end
