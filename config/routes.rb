Rails.application.routes.draw do
  root "pages#index"

  get "/home", to: "pages#show", as: "home"
  get "/", to: "pages#index", as: "landing"
end
