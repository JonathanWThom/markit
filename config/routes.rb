Rails.application.routes.draw do
  resources :predictions, only: [:index, :show]
  root "predictions#show", id: Prediction.last.id
end
