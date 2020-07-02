Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
  resources :predictions, only: [:index, :show] 
  root "predictions#last"
  resources :average_sentiments, only: [:index]
end
