Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#index'
  get '/urls/:short_url', to: 'links#show', as: :short
  get '/urls/:short_url/stats', to: 'links#stats'

  resources :links, only: [:index, :new, :create]
end
