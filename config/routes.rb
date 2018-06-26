Rails.application.routes.draw do
  root 'home#top'
  post 'topics/classfy_topic'
  get '/login' => 'users#login'
  resources :users
  resources :topics do
    resources :ideas
  end
end
