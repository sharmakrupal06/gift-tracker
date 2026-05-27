Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :registrations, only: [:new, :create]

  resources :people do
    resources :gifts_givens
    resources :gift_ideas
  end

  root "people#index"
end
