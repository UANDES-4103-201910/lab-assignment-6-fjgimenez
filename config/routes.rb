Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  root :to => 'sessions#new'

  post '/login',   to: 'sessions#create', as: :log_in
  delete '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  resources :sessions

  get 'signup'  => 'users#new'
    resources :users

  get '/home' => 'welcome#index'

  get '/forsale' => 'forsale#view'

  get '/contact' => 'contact#view'

  get '/about' => 'about#view'

end
