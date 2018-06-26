Rails.application.routes.draw do
  root 'home#top'
  post 'topics/classfy_topic'
  resources :users
  resources :topics do
    resources :ideas do
      resources :like, only: [:create, :destroy]
    end
  end
end
