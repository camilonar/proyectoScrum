class HistoriasController < ApplicationController
layout "user"
before_action :authenticate_user!



#Se visualiza la vista de crear un proyecto
def new
	@historia = Historiausuario.new
end 

#Se crea un proyecto
def create
	@historia = Historiausuario.new(historia_params)
	if @historia.save
		flash[:notice] = "Historia creada satisfactoriamente"
		redirect_to project_details_path(:id => historia_params[:proyecto_id] )
	else 
		flash[:alert] = "No se puede crear la historia"
		redirect_to project_details_path(:id => historia_params[:proyecto_id] )
	end
end


#  mostrar Inforacion relacionada al miembro


#Parametros en la creacion de un proyecto
def historia_params
      params.require(:historia).permit(:His_Nombre, :His_Descripcion,:His_Prioridad, :His_Esfuerzo,:proyecto_id)
end


end 
