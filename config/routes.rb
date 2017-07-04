Rails.application.routes.draw do
  

  get '/welcome', to: 'welcome#index'
  get '/about', to: 'pages#about'
  get '/home', to: 'pages#home' 
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resource :sessions
   root 'researches#index'
   resources :researches 
end
