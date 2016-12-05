class Tarea < ActiveRecord::Base
	belongs_to :sprint
	belongs_to :user
end