Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  post 'retweet/:id', to: 'tweets#retweet'
  get 'api/news', to: 'api#news'
  get 'api/:fecha1/:fecha2', to: 'api#tweets_range'
  post 'api/create', to: 'api#create'
  root to: 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
