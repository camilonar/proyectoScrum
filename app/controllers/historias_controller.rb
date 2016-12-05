class HistoriasController < ApplicationController
layout "user"
before_action :authenticate_user!



#Se visualiza la vista de crear un proyecto
def new
	@historia = Historiausuario.new
	@proyecto = Proyecto.find(params[:id])
		respond_to do |format|               
   			format.js{render layout: false}
  		end
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


def edit
		@historia = Historiausuario.find(params[:id])
		respond_to do |format|               
   			format.js{render layout: false}
  		end
	end


	def update
	    @historia= Historiausuario.find(params[:id])

	    if @historia.update(historia_params)
	        flash[:notice] = "Historia de usuario actualizada exitosamente"
	        redirect_to  project_details_path(:id => historia_params[:proyecto_id] )
	    else
	        flash[:alert] = "No se pudo actualizar la Historia de usuario"
	         redirect_to  project_details_path(:id => historia_params[:proyecto_id] )
	    end
	end



	def updatesprint
		@historia = Historiausuario.find(params[:id])

		if (params.has_key?(:sprint_id))
          @historia.update(sprint_id: params[:sprint_id])
      	else
		 @historia.update(sprint_id: nil)
	 	end 
	      render json: @historia.to_json

	end 




	def delete
		@historia = Historiausuario.find(params[:id])
		
		respond_to do |format|               
   			format.js{render layout: false}
  		end
	end

	def destroy
	    @historia=Historiausuario.find(params[:id])
	    @historia.destroy()
	    flash[:notice] = "Historia de usuario eliminada exitosamente"
	    redirect_to project_details_path(:id => params[:proyecto_id] )
	end


#  mostrar Inforacion relacionada al miembro


#Parametros en la creacion de un proyecto
def historia_params
      params.require(:historia).permit(:His_Nombre, :His_Descripcion,:His_Prioridad, :His_Esfuerzo,:proyecto_id,:sprint_id)
end


end 
