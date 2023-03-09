Rails.application.routes.draw do
# WE DELETED SOME ROUTES
  root to: "pages#landing"
  devise_for :users

  # get '/landing', to: "pages#landing"
  get '/home', to: "pages#home", as: :home

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/profile", to: "pages#profile"
  resources :pages, only: [ :index, :show]

  get "/pills", to: "pages#pills"
  patch "/pills/confirm/:id", to: "prescriptions#confirm", as: :pills_confirm_prescription

  get "/cares", to: "pages#cares"
  patch "/cares/confirm/:id", to: "prescriptions#confirm"

  get "/exercices", to: "pages#exercices"
  patch "/exercices/confirm/:id", to: "prescriptions#confirm"

  resources :prescriptions, only: [ :index, :new, :create, :edit, :update]
  resources :prescriptions, only: [ :destroy], as: :destroy_prescription
  # get "", to: "appointments#confirm"
  resources :appointments, only: [ :index, :show, :new, :create, :edit, :update, :destroy]

  resources :diaries, only: [ :index, :show, :new, :create]
  get "/uikit", to: "pages#uikit"
end
