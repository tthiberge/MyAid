Rails.application.routes.draw do
#WE DELETED SOME ROUTES
  root to: "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"
  resources :pages, only: [ :index, :show]
  # get "", to: "prescriptions#confirm"
  get "/prescriptions/pills", to: "prescriptions#pills"
  get "/prescriptions/cares", to: "prescriptions#cares"
  get "/prescriptions/pills", to: "prescriptions#pills"
  resources :prescriptions, only: [ :index, :new, :create, :edit, :update, :destroy]
  # get "", to: "appointments#confirm"
  resources :appointments, only: [ :index, :show, :new, :create, :edit, :update, :destroy]
  resources :diaries, only: [ :index, :show, :new, :create]
end
