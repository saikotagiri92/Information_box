InformationHouse::Application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    unlocks: 'users/unlocks'
  }

  root 'organisations#show'
  
  post '/user-feedback', to: 'users#user_feedback_create', :as => :user_feedback_create
  put '/users/:id/toggle_admin_privileges' => 'users#toggle_admin_privileges', as: :toggle_user_admin_privileges
  put '/users/:id/toggle_active_privileges' => 'users#toggle_active_privileges', as: :toggle_user_active_privileges
  put '/users/:id/assign_role' => 'users#assign_role', as: :user_assign_role
  resources :application_bugs, only: :create
  
  get "/404", :to => "error_pages#not_found"
  get "/422", :to => "error_pages#unacceptable"
  get "/500", :to => "error_pages#internal_error"

  resources :organisations do
    resources :roles, except: :show

    member do
      get 'people'
    end

    resources :boxes do
      post 'assign_users'
      resources :articles do
        resources :comments, except: [:new, :index]
      end
    end
  end

  post '/user_invitations/articles/:id/' => 'user_invitations#article_invitation', as: :article_invitation
  post '/user_invitations/organisations/:id/' => 'user_invitations#organisation_invitation', as: :organisation_invitation

  post 'feedbacks', to: 'feedbacks#create', :as => :create_feedback
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
