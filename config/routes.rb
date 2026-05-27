Rails.application.routes.draw do
  get "gift_ideas/create"
  get "gift_ideas/destroy"
  resources :people do
    resources :gifts_givens
    resources :gift_ideas
  end

  root "people#index"
end
