Rails.application.routes.draw do
  resources :people do
    resources :gifts_givens
  end

  root "people#index"
end
