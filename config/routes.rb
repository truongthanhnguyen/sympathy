Rails.application.routes.draw do
  root "pages#index"

  devise_for :users, class_name: "FormUser", controllers:
    {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations"}

  get "/home", to: "pages#show", as: "home"
  get "/", to: "pages#index", as: "landing"
end
