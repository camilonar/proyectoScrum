class HistoriasController < ApplicationController
layout "user"
before_action :authenticate_user!



#Se visualiza la vista de crear un proyecto
def new
	@historia = Historiausuario.new
end 

#Se crea un proyecto
def create
	  @historia = Historiausuario.new(proyecto_params)
	  if @historia.save
        flash[:notice] = "Historia creada satisfactoriamente"
    else 
      flash[:alert] = "No se puede crear la historia"
      render 'new'
    end
end


#  mostrar Inforacion relacionada al miembro


#Parametros en la creacion de un proyecto
def proyecto_params
      params.require(:historia).permit(:His_Nombre, :His_Descripcion,:His_Prioridad, :His_Esfuerzo)
end


end 
