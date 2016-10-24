class Miembro < ActiveRecord::Base
  belongs_to :user
  belongs_to :proyecto
  has_one :rol
   #validates: nombre, presence:true, los campos  que se deben de colocar
end
