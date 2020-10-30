Rails.application.routes.draw do

  resources :trabajadors do
    resources :episodes
  end

  resources :contactos



  get 'entrada/index'
  root 'entrada#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
