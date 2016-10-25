class ProjectsController < ApplicationController
layout "user"
before_action :authenticate_user!
require 'will_paginate/array' #Esto permite paginar con Arrays

#Se visualiza la lista de proyectos
def index
    @proyectos = current_user.proyectos
    @miembros = current_user.miembros
    @miembros.each do |miembro|
        @proyectos = @proyectos + [miembro.proyecto]
    end
    @proyectos = @proyectos.paginate(:page => params[:page], :per_page => 10)
    
end

#Se visualiza la vista de crear un proyecto
def new
	@proyecto = Proyecto.new
    # modificando datos  para mostrar datos del rol 
    @nombre_correos= User.all()
    @nombre_rols= Rol.all()
end 

#Se crea un proyecto
def create
	@proyecto = current_user.proyectos.new(proyecto_params)
	if @proyecto.save
        flash[:notice] = "Proyecto creado exitosamente"
    	redirect_to projects_path
    else 
       #mofifico paola
      flash[:alert] = "No se pudo crear el proyecto"
      render 'new'
    end
end

def edit
    @proyecto= Proyecto.find(params[:id])
end

def destroy
    @proyecto=Proyecto.find(params[:id])
    @proyecto.destroy()
    flash[:notice] = "Proyecto eliminado exitosamente"
    redirect_to "/projects"
end

def update
    @proyecto= Proyecto.find(params[:id])

    if @proyecto.update(proyecto_params)
        flash[:notice] = "Proyecto actualizado exitosamente"
        redirect_to  '/projects'
    else
        flash[:alert] = "No se pudo actualizar el proyecto"
        render :edit
    end
end

#Se visualizan los detalles de un proyecto
def details
    @proyecto = Proyecto.find(params[:id])
end

#Se permitira ver en detalle los miembors de un proyecto.
def miembros
    @q = params[:id]
    @miembros=Miembro.where(:proyecto_id => @q).paginate(:page => params[:page], :per_page => 5)
   
    @miembro = Miembro.new  #crea un nuevo articulo que no se guarda en la base de datos, solo esta en memoria. (hay toca mandarle el array)
    @nombre_roles=Rol.all()
    @nombre_correos= User.all()


end

def create
        @miembro=Miembro.new(miembro_params)
        if @miembro.save
            flash[:notice] = "Miembro Registrado exitosamente"
            redirect_to  '/projects/details/miembros'
        else
            @nombre_roles=Rol.all()
            render :miembros

        end
        
    end

#  mostrar Inforacion relacionada al miembro


#Parametros en la creacion de un proyecto
def proyecto_params
      params.require(:proyecto).permit(:proy_nombre, :proy_descripcion, :photo, :proy_estado, :proy_fechainicio, :proy_fechafinalizacion)
end

def miembro_params
        params.require(:miembro).permit(:user_id, :proyecto_id, :rol_id)
end


end 
