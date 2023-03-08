Rails.application.routes.draw do
#WE DELETED SOME ROUTES
  root to: "pages#home"
  devise_for :users

  get '/landing', to: "pages#landing"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"
  resources :pages, only: [ :index, :show]
  # get "", to: "prescriptions#confirm"
  get "/pills", to: "pages#pills"
  get "/cares", to: "pages#cares"
  get "/exercices", to: "pages#exercices"
  resources :prescriptions, only: [ :index, :new, :create, :edit, :update, :destroy]
  # get "", to: "appointments#confirm"
  resources :appointments, only: [ :index, :show, :new, :create, :edit, :update, :destroy]
  resources :diaries, only: [ :index, :show, :new, :create]
  get "/uikit", to: "pages#uikit"
end
