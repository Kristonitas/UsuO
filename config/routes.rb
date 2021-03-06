Rails.application.routes.draw do

  mount EpicEditor::Engine => "/"
  root 'questions#index'

  resources :questions, param: :id_token do
    post '/answers', :to => 'responses#create', :as => :responses
    # resources :responses, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/tags', :to => 'tags#index', :as => :tags
  get '/tags/:name', :to => 'tags#show', as: :acts_as_taggable_on_tag

  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    get '/users/edit/password', :to => 'users/registrations#edit_password', as: :edit_password
  end
  get '/users/:id_token', :to => 'users#show', :as => :user
  get '/users', :to => 'users#index', :as => :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
