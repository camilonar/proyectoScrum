class UsersController < ApplicationController
	before_action :authenticate_user!
	layout "user"
	def index
		@usuarios=User.all
	end
end
