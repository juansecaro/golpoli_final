Rails.application.routes.draw do
  
  devise_for :users

  resources :institutions do
    resources :pitches do
      resources :schedules
    end
  end

  resources :contacts
  resources :users, only: [:show]

  root 'institutions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
