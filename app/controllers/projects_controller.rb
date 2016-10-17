class ProjectsController < ApplicationController
layout "user"
before_action :authenticate_user!

def index
	@proyectos = current_user.proyectos.paginate(:page => params[:page], :per_page => 2)
end

def new
	@proyecto = Proyecto.new

end 
def create
	@proyecto = current_user.proyectos.new(proy_nombre:params[:nombre],
				proy_descripcion:params[:descripcion],proy_estado:"Abierto")
	@proyecto.save
    redirect_to "/projects"
end

end 
