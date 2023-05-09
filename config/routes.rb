Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  post '/register', to: 'users#create'

  get '/checklist', to: 'checklists#index'
  post '/checklist', to: 'checklists#create'
  delete '/checklists/:id', to: 'checklists#delete'
  namespace :api do
    namespace :v1 do
      get 'customers', to: 'customers#index'
      post 'customers', to: 'customers#create'
      delete 'customers/:id', to: 'customers#delete'
      get 'customers/:id', to: 'customers#show'
      put 'customers/:id', to: 'customers#update'

      get 'products', to: 'products#index'
      get 'products/:id', to: 'products#show'
      delete 'products/:id', to: 'products#delete'
      post 'products', to: 'products#create'
      put 'products/:id', to: 'products#update'

      get 'transactions', to: 'transactions#index'
      get 'transactions/:id', to: 'transactions#show'
      post 'transactions', to: 'transactions#create'
      delete 'transactions/:id', to: 'transactions#delete'
      put 'transactions/:id', to: 'transactions#update'

      get 'payment_methods', to: 'payment_methods#index'
      get 'payment_methods/:id', to: 'payment_methods#show'
      post 'payment_methods', to: 'payment_methods#create'
      put 'payment_methods/:id', to: 'payment_methods#update'
      delete 'payment_methods/:id', to: 'payment_methods#delete'
    end
  end
end
