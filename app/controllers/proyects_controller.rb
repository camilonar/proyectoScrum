class ProyectsController < ApplicationController
layout "user"
def index
@proyectos = Proyecto.paginate(:page => params[:page], :per_page => 1)
end

end 
