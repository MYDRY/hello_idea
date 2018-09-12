Rails.application.routes.draw do
  root 'home#top'
  post 'topics/classfy_topic'
  get '/login' => 'users#login'
  post '/login' => 'users#check_user'
  get '/logout' => 'users#logout'
  
  resources :users, shallow: true do
    resources :notices
  end
  post 'notices/:id/mark', to: 'notices#mark'
  
  resources :topics, shallow: true do
    resources :ideas do
      resources :likes, only: [:create, :destroy]
    end
  end
end
