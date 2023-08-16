Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/dashboard', to: 'projects#dashboard', as: :dashboard
  get '/history', to: 'projects#history', as: :history
  get '/next_question', to: 'questions#next_question'
  resources :buddies, only: %i[new create show update] do
    post 'feed', on: :member
  end
  resources :buddies, only: %i[new create show update]
  resources :projects, only: %i[index new create show update]
  resources :questions, only: %i[index show]
  resources :profiles, only: %i[index edit update]
  post 'generate_response', to: 'questions#show', as: :generate_response
end
