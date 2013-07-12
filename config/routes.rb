Community::Application.routes.draw do
  devise_for :members,:controllers => { :registrations =>'registration'}
  devise_for :members ,:controllers => {:passwords => "passwords"} do
    resources :passwords
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.


  match 'dashboard' => 'home#dashboard'

  match 'register' =>'registration#register'
  
  root :to => 'home#index'

  resources :contacts
  resources :accounts
  resources :contracts
  resources :opportunity
  resources :users
  resources :roles

  resources :leads do
    collection do
      put :convert_lead
    end
  end
  match 'lead/:id/convert' => 'leads#convert_lead', :as => :convert_lead
  match 'leads/:id' => 'leads#update', :via => [:post]
  match 'contacts/:id' => 'contacts#update', :via => [:post]
  match 'accounts/:id' => 'accounts#update', :via => [:post]
  match 'account/:id/get_contacts' => 'accounts#get_contacts', :as => :get_contacts, :via => [:get]
  match 'users/:id/edit' => 'users#update', :via => [:post]
  match 'passwords/:id/edit' => 'passwords#update', :via => [:post]
  match 'users/new' => 'users#create', :via => [:post]
  match 'roles/:id/edit' => 'roles#update', :via => [:post]
  match 'roles/new' => 'roles#create', :via => [:post]

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
  # match ':controller(/:action(/:id(.:format)))'
end
