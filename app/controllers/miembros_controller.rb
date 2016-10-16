class MiembrosController < ApplicationController
	layout "user"
	before_action :authenticate_user!
	def index
	 #@miembros=Miembro.paginate(page:params[:page], per_page:2).all?()	
	end

   def create
		@miembro=Miembro.new(miembro_params)

		if @miembro.save
			redirect_to @miembro
		else
			@nombre_roles=Rol.all()
			render :new
		end

    end

    def update
		@miembro=Miembro.find(params[:id])

		if @miembro.update(miembro_params)
			redirect_to @miembro
		else
			render :edit
		end

    end
    
    def show
       @miembro=Miembro.find(params[:id])
	end

	def destroy
		 @miembro=Miembro.find(params[:id])
		 @miembro.destroy()
		 redirect_to "/miembros"
    end


    private 
    def miembro_params
    	params.require(:miembro).permit(:user_id, :proyecto_id, :rol_id)
    end



  
end


