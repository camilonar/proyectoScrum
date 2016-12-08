class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :proyectos
   has_many :tareas
   has_many :miembros
   belongs_to :role
   has_attached_file :photo
   before_save :assign_role
	#validates_attachment :photo, dimensions: { height: 30, width: 30 }
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    def assign_role
    self.role = Role.find_by name: "propietario" if self.role.nil?
  end
  
  def propietario?
    self.role.name == "propietario"
  end
end
