Rails.application.routes.draw do
  #Sin esto se toman los controladores de devise por defecto
   
  resources :projects

  devise_for :users, controllers: { 
      sessions: 'user/sessions',
      passwords: 'user/passwords',
      registrations: 'user/registrations',
  }

  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

   get 'about' => 'welcome#about'
   get 'news'  => 'welcome#news'
   get 'login' => 'users#index'
   get 'projects/index' => 'projects#index'
   get 'projects/new' => 'projects#new'
   
   #TODO:Andres
   get 'projects/details/miembros' => 'projects#miembros'
   post 'projects/details/miembros' => 'projects#miembros'
   

   post 'projects/index' => 'projects#index' #TODO: modificar ruta cuando se creen los servicios de editar y eliminar
   post 'projects/new' => 'projects#create'

   get 'projects/edit' => 'projects#edit' #TODO: modificar ruta cuando se creen los servicios de editar y eliminar
   post 'projects/:id/edit' => 'projects#edit'
   put 'projects/:id/edit' => 'projects#update'
   post 'projects/:id' => 'projects#destroy'
   
   #TODO: paola
   #delete '/miembros/:id' => 'miembros#destroy', as: 'miembros_destroy'
   resources:miembros

   get 'miembros/edit' => 'miembros#edit' 
   post 'miembros/:id/edit' => 'miembros#edit'
   put 'miembros/:id/edit' => 'miembros#update'


   get 'miembros/index' =>'miembros#index'
   #get 'miembros/editar' =>'miembros#editar'
   get 'miembros/registrar' =>'miembros#registrar'
   post 'miembros/:id'=>'miembros#destroy'
   post 'miembros/index' =>'miembros#index'
   post 'miembros/registrar' =>'miembros#registrar'
   
   get 'project/details' => 'projects#details'

   post 'projects/sprints/new' => 'sprints#create', as: 'sprint_create' 
   post 'projects/historias/new' => 'historias#create', as: 'historia_create' 
   
    


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
