class Historiausuario < ActiveRecord::Base
  belongs_to :proyect
  belongs_to :sprint
end
