Rails.application.routes.draw do
  root 'home#top'
  # get 'ideas/show'
  # get 'topics/index'
  # get 'topics/ideal'
  # get 'topics/trouble'
  # get 'topics/other'
  # get 'topics/:id' => 'topics#show'
  resources :topics do
    resources :ideas
  end
end
