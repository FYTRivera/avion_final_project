Rails.application.routes.draw do
  resources :meetings
  devise_for :users
  resources :users do
    get 'buy', to: 'meetings#new'
  end

  get 'calendar', to: 'homepage#calendar'
  get 'available', to: 'homepage#available'
  get 'scheduled', to: 'homepage#scheduled'
  get 'unapproved', to: 'homepage#unapproved'
  root "homepage#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
