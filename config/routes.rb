Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'articles#index'

  resources :users, only:  %i[new create]
  resources :articles, only: %i[index show]
  resource :session, only: %i[new create destroy] do
  	resources :articles, only: %i[new create edit update destroy]
  end
end
