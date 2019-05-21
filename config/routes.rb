Rails.application.routes.draw do
  root "doctors#index"

  resources :users do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
  
  get "/:user_id/index_appointments", to: "appointments#index_by_user"
  get "/:user_id/new_user_appointments", to: "appointments#new_by_user"
  
  
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end

end
