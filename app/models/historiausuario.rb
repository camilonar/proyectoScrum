class Historiausuario < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :sprint
end
