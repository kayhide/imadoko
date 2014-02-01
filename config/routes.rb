Imadoko::Application.routes.draw do
  root 'races#index'

  resources :races
  resources :entries

  namespace :cron do
    get :crawl
  end
end
