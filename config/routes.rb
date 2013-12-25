Imadoko::Application.routes.draw do
  root 'races#index'

  resources :races
  resources :entries
end
