class TareasController < ApplicationController
	layout "user"
	before_action :authenticate_user!

	def new
		@tarea = Tarea.new
		@id = params[:id]
		@historia_id = params[:historia_id]
		respond_to do |format|               
   			format.js{render layout: false}
  		end
	end 

	def create
		@tarea=Tarea.new(tarea_params)
		#articulo.valid? || articulo.invalid? devuelven booleanos de la pregunta, es una forma de preguntar antes de guardar.
		if @tarea.save
			flash[:notice] = "La tarea se ha creado exitosamente"
			redirect_to taskboard_path(:id => tarea_params[:sprint_id] )
		else
			flash[:alert] = "Ha ocurrido un error al crear la tarea"
			@nombre_roles=Rol.all()
			redirect_to taskboard_path(:id => tarea_params[:sprint_id] )
		end
		
	end

	private 
    def tarea_params
    	params.require(:tarea).permit(:Asunto, :Descripcion, :Estado, :Estimacion, :sprint_id, :historiausuario_id, :user)
    end
end
