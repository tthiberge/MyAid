Rails.application.routes.draw do
#WE DELETED SOME ROUTES
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pages, only: [ :index, :show, :profile]
  resources :prescriptions, only: [ :index, :new, :create, :edit, :update, :destroy, :confirm]
  resources :appointments, only: [ :index, :show, :new, :create, :edit, :update, :destroy, :confirm]
  resources :diaries, only: [ :index, :show, :new, :create]
  get "/uikit", to: "pages#uikit"
end
