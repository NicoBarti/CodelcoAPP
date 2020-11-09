Rails.application.routes.draw do

  resources :trabajadors do
    resources :episodes, shallow: true
    resources :tests, shallow: true
  end

resources :episodes, only: [:show, :edit, :update, :destroy] do
  resources :contactos, shallow: true
  resources :sintomas, shallow: true
  resources :seguimientos, shallow: true
end


  get 'entrada/index'
  root 'entrada#index'

  # get 'reporte/index'

  resources :reporte, only: :index


  get 'episodes/:id/:cerrar', to: 'episodes#edit'
  # get 'episodes#cerrar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
