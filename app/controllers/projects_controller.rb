class ProjectsController < ApplicationController
layout "user"
before_action :authenticate_user!

#Se visualiza la lista de proyectos
def index
	@proyectos = current_user.proyectos.paginate(:page => params[:page], :per_page => 10)
end

#Se visualiza la vista de crear un proyecto
def new
	@proyecto = Proyecto.new

end 

#Se crea un proyecto
def create
	@proyecto = current_user.proyectos.new(proyecto_params)
	if @proyecto.save
    	redirect_to projects_path
    else 
    	render 'new'
    end
end

#Se visualizan los detalles de un proyecto
def details
    @proyecto = Proyecto.find(params[:id])
end

#Parametros en la creacion de un proyecto
def proyecto_params
      params.require(:proyecto).permit(:proy_nombre, :proy_descripcion, :photo, :proy_estado)
    end

end 
