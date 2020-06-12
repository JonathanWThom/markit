Rails.application.routes.draw do
  resources :predictions, only: [:index, :show] 
  root "predictions#last"
end
