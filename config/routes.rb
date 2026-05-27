Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :registrations, only: [:new, :create]

  resources :people do
    resources :gifts_givens
    resources :gift_ideas
    resources :events, only: [:create, :destroy]
  end

  get "/about", to: "pages#about"

  root "people#index"
end
