class Tarea < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :historiausuario
	belongs_to :user
end