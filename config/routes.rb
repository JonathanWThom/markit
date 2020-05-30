Rails.application.routes.draw do
  resources :predictions, only: [:index]
  root "predictions#index"
end
