Rails.application.routes.draw do
    #devise_for :users, :controllers => {:registrations => "registrations"}
devise_for :users, controllers: { sessions: "sessions", 
  registrations: "registrations", passwords: "passwords", :confirmations => "confirmations"}  do 
  match '/edit', :to => 'devise/registrations#edit'
  end
  get 'tag/index'
  resources :followuptypes
  resources :cases
  resources :contacts
  resources :sales
  get 'welcome/edit_user'
  #get '/my_profile', to: 'sales#my_profile'
  get '/search', to: 'sales#search'
  get '/dashboard', to: 'sales#dashboard'
  get 'welcome/forget_password_developer'
  get 'contacts/details'
  get 'cases/details'
  get 'tag/index'
  post '/sales/list_ajax'
  post '/cases/list_ajax'
  post '/contacts/list_ajax'

devise_scope :user do
  authenticated :user do
    root 'sales#dashboard', as: :authenticated_root
  end
  unauthenticated :user do
  root :to => "devise/sessions#new"
  end
end

devise_scope :user do
  get "/my_profile" => "registrations#edit"
  get '/users/sign_out' => 'sessions#destroy'
end
#   authenticated :user do
#   root :to => 'devise/sessions#new', :as => :authenticated_root
# end
# root :to => redirect('/users/sign_in')
#   devise_scope :user do
#   root :to => 'devise/sessions#new'
# end
  # get 'users/edit'
  # get 'contacts/:id' => 'contacts#contacts_details', as: :contacts_details
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 # root 'devise/sessions#new'
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
