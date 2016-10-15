class ProjectsController < ApplicationController
layout "user"
before_action :authenticate_user!
def index
@proyectos = Proyecto.paginate(:page => params[:page], :per_page => 2)
end

end 
