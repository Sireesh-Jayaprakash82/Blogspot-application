Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :blogs
  root "blogs#index"
  get "/search", to: "blogs#search"
  get "/date", to: "blogs#date"
  # get "/blogs/:id", to: "blogs#destroy
end
