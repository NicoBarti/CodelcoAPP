Rails.application.routes.draw do

  resources :seguimientos
  resources :trabajadors do
    resources :episodes, shallow: true
  end

resources :episodes, only: [:show, :edit, :update, :destroy] do
  resources :contactos, shallow: true
  resources :sintomas, shallow: true
end



  get 'entrada/index'
  root 'entrada#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
