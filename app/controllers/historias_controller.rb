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
	 @proyecto = Proyecto.find(historia_params[:proyecto_id])
     @numhistorias=@proyecto.historiausuarios.count()
     @historia.update(His_Prioridad: (@numhistorias-1));
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
	        redirect_to(:back)
	    else
	        flash[:alert] = "No se pudo actualizar la Historia de usuario"
	        redirect_to(:back)
	    end
	end



	def updatesprint
		@historia = Historiausuario.find(params[:id])

		if (params.has_key?(:sprint_id))
          @historia.update(sprint_id: params[:sprint_id])
          #flash[:notice] = "Historia de usuario asignada exitosamente"
      	else
		 @historia.update(sprint_id: nil)
		    flash[:notice] = "La Historia de Usuario no pudo asignarse al Sprint"
	 	end 
	      render json: @historia.to_json

	end 


	def updateprioridad
		@historia = Historiausuario.find(params[:id])
        @historia.update(His_Prioridad: params[:His_Prioridad])

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
	    redirect_to(:back)
	end


#  mostrar Inforacion relacionada al miembro


#Parametros en la creacion de un proyecto
def historia_params
      params.require(:historia).permit(:His_Nombre, :His_Descripcion,:His_Prioridad, :His_Esfuerzo,:proyecto_id,:sprint_id)
end


end 
