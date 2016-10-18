class ProjectsController < ApplicationController
layout "user"
before_action :authenticate_user!

def index
	@proyectos = current_user.proyectos.paginate(:page => params[:page], :per_page => 10)
end

def new
	@proyecto = Proyecto.new

end 
def create
	@proyecto = current_user.proyectos.new(proyecto_params)
	if @proyecto.save
    	redirect_to projects_path
    else 
    	render 'new'
    end
end

def proyecto_params
      params.require(:proyecto).permit(:proy_nombre, :proy_descripcion, :photo, proy_estado:"Abierto")
    end

end 
