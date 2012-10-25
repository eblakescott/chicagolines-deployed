Chicagolines::Application.routes.draw do
  devise_for :members

  resources :pages

root :to => 'pages#welcome' # map / to the custom welcome action of the pages controller

 # We will set up a custom route here, using a URL pattern referring to the :category
  # field in the model, and point it to a custom category action on the locations
  # controller. Finally, we give this route a name so we can use link_to and other
  # Rails helpers, should we decide to change the URL pattern before deploying the app
  # to the world, for example.
  get "/locations/:category/list" => "locations#category", :as => "locations_by_category"

  resources :locations do
	resources :waits, :only => [:index, :create, :destroy]
        # No need to show individual Waits,
        # or to edit/update existing ones.
        # Just list all the Waits on a given
        # Location, and enable the creation of
        # a new Wait via a form right on the index.html.erb
        # view, rather than a separate new.html.erb (thus no :new)
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
