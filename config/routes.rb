Rails.application.routes.draw do
  root 'home#top'
  get '/detail' => 'home#detail'
  post 'topics/classfy_topic'
  get '/login' => 'users#login'
  post '/login' => 'users#check_user'
  get '/logout' => 'users#logout'
  resources :users
  resources :topics, shallow: true do
    resources :ideas do
      resources :likes, only: [:create, :destroy]
    end
  end
end
