Rails.application.routes.draw do
  resources :join_invitations, only: %i[ index create ], as: :join_accounts, path: "join"
  resource :session
  resources :users
  resources :passwords, param: :token

  # Routes under account slug
  resources :accounts, param: :slug do
    resources :invitations
    get "dashboard" => "dashboard#index", as: :dashboard

    get "settings" => "accounts#edit", as: :settings
    patch "settings" => "accounts#update"


    get "members" => "members#index", as: :members
    get "members/:id" => "members#show", as: :member
    delete "members/:id" => "members#destroy"
    patch "members/:id" => "members#update"
  end
  patch "update-current" => "accounts#update_current_account", as: "update_current_account"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
