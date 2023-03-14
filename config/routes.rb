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
  resources :pages, only: [:index, :show]

  get "/pills", to: "pages#pills"
  patch "/pills/confirm/:id", to: "prescriptions#confirm", as: :pills_confirm_prescription

  get "/cares", to: "pages#cares"
  patch "/cares/confirm/:id", to: "prescriptions#confirm", as: :cares_confirm_prescription

  get "/exercises", to: "pages#exercises"
  patch "/exercises/confirm/:id", to: "prescriptions#confirm", as: :exercises_confirm_prescription

  resources :prescriptions, only: [:index, :new, :create, :edit, :update]
  resources :prescriptions, only: [:destroy], as: :destroy_prescription

  patch "/appointments/:id/confirm", to: "appointments#confirm", as: :appointments_confirm
  resources :appointments, only: [:index, :show, :new, :create, :edit, :update]
  resources :appointments, only: [:destroy], as: :destroy_appointment

  resources :diaries, only: [:index, :show, :new, :create, :update] do
    resources :selfies
  end
  get "/uikit", to: "pages#uikit"
  get "/uikitbis", to: "pages#uikitbis"
  get "/uikitter", to: "pages#uikitter"
  get "/calendarinfini", to: "pages#calendars"

  get "/boost", to: "pages#boost"
end
