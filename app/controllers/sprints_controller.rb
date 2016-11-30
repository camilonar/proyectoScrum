class SprintsController < ApplicationController
	layout "user"
	before_action :authenticate_user!

	#Se visualiza la vista de crear un sprint
	def new
		@sprint = Sprint.new
		@id = params[:id]
		respond_to do |format|               
   			format.js{render layout: false}
  		end
	end 

	def taskboard
		
	end
	#Se crea un sprint
	def create
		@sprint=Sprint.new(sprint_params)
		if @sprint.save
			flash[:notice] = "El Sprint se ha creado exitosamente"
			redirect_to project_details_path(:id => sprint_params[:proyecto_id] )
		else
			flash[:alert] = "El Sprint no ha podido ser creado"
			redirect_to project_details_path(:id => sprint_params[:proyecto_id] )
		end
	end

	def edit
		@sprint = Sprint.find(params[:id])
		respond_to do |format|               
   			format.js{render layout: false}
  		end
	end

	def update
	    @sprint= Sprint.find(params[:id])

	    if @sprint.update(sprint_params)
	        flash[:notice] = "Sprint actualizado exitosamente"
	        redirect_to  project_details_path(:id => sprint_params[:proyecto_id] )
	    else
	        flash[:alert] = "No se pudo actualizar el proyecto"
	         redirect_to  project_details_path(:id => sprint_params[:proyecto_id] )
	    end
	end

	#Parametros en la creacion de un sprint
def sprint_params
      params.require(:sprint).permit(:sprint_nombre, :sprint_fechainicio,:sprint_fechafinalizacion, :proyecto_id)
end
end
