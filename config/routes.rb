Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'movies/:id/summary', to: 'movies#show'

  # get 'movies/:id/summary', to: 'movies#summary'
  # this is the route that we want to create but only if we also create the custome method in the movies controller that points the summary 

  get 'movie_summaries', to: 'movies#summaries'
end
