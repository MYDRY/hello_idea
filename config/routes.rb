Rails.application.routes.draw do
  root 'home#top'
  post 'topics/classfy_topic'
  resources :topics do
    resources :ideas
  end
end
