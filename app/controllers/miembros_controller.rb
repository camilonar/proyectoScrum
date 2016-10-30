class MiembrosController < ApplicationController
	layout "user"
	before_action :authenticate_user!
	def index

	 #@miembros=Miembro.paginate(page:params[:page], per_page:2).all?()	
    end
 
	def new

		@miembro = Miembro.new  #crea un nuevo articulo que no se guarda en la base de datos, solo esta en memoria. (hay toca mandarle el array)
		@nombre_roles=Rol.all()
		@nombre_correos= User.all()
	end




	def create
		@miembro=Miembro.new(miembro_params)
		#articulo.valid? || articulo.invalid? devuelven booleanos de la pregunta, es una forma de preguntar antes de guardar.
		if @miembro.save
			flash[:notice] = "El Miembro  se ha Agregado Exitosamente al Equipo de Trabajo"
			redirect_to projects_details_miembros_path(:id => miembro_params[:proyecto_id] )
		else
			flash[:alert] = "El Miembro no se ha Agregado Exitosamente al Equipo de Trabajo "
			@nombre_roles=Rol.all()
			render :new
		end
		
	end



    
   def edit
      
       @miembro = Miembro.find(params[:id]) 
       @nombre_roles=Rol.all()
	   
	end

   
  
    def update
		@miembro=Miembro.find(params[:id])

		if @miembro.update(miembro_params)
		    flash[:notice] = "El Miembro  se ha Actualizado  Exitosamente "
			redirect_to projects_details_miembros_path(:id => miembro_params[:proyecto_id] )
		else
			flash[:notice] = "El Miembro  No se pudo Actualizar "
			render :edit
		end

    end

    
    def show
       @miembro=Miembro.find(params[:id])
	end

	def destroy
		 @miembro=Miembro.find(params[:id])
		 @miembro.destroy()
		 flash[:notice] = "Miembro del equipo de trabajo Exitosamente"
		 redirect_to projects_details_miembros_path(:id => params[:proyecto_id] )
    end


    private 
    def miembro_params
    	params.require(:miembro).permit(:user_id, :proyecto_id, :rol_id)
    end



  
end


