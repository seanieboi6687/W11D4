Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    get '/pokemon/types', to: 'pokemon#types', as: 'pokemon_types'
    resources :pokemon, only: [:index, :create, :show, :update]
    resources :items, only: [:index, :create, :destroy, :update]
  end
end
