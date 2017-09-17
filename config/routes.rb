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
  resources :charges

  root 'institutions#index'
  # JSON Schedule handdling
  get '/horarios', to: 'pitches#get_schedule'
  # JSON with changes
  post '/summary', to: 'pitches#summary'
  get '/confirm', to: 'pitches#confirm'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
