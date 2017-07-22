Rails.application.routes.draw do

  devise_for :users

  resources :institutions do
    resources :pitches do
      resources :schedules
    end
  end
  resources :schedules
  resources :contacts
  resources :users, only: [:show]

  root 'institutions#index'
  # JSON Schedule handdling
  get '/horarios', to: 'pitches#get_schedule'
  post '/horarios', to: 'pitches#set_schedule'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
