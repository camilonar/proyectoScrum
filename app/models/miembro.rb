class Miembro < ActiveRecord::Base
  belongs_to :user
  belongs_to :proyecto
  has_one :rol
   
   #esto me permite validar que un  miembro se pueda registrar una unica vez a un proyecto especifico
   validates_uniqueness_of :user_id, :scope => :proyecto_id
end
