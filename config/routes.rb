Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "home#index"
  get '/catalog', to: "catalog#index"
  get '/shopping', to: "shopping#index"
  get '/delivery_info/new', to: "orders#delivery_info_new"
  get '/orders/new', to: "orders#new"
  post '/orders/create', to: "orders#create"
  post '/delivery_info/create', to: "orders#delivery_info_create"
  post '/shopping', to: "shopping#add_to_list"
  delete '/shopping', to: "shopping#remove_from_list"
end
