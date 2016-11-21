class SprintsController < ApplicationController
	layout "user"
	before_action :authenticate_user!

	#Se visualiza la vista de crear un sprint
	def new
		@sprint = Sprint.new
	end 
end
