Rails.application.routes.draw do
  get 'topics/index'
  get 'home/top'
  root 'home#top'
  get 'topics/ideal'
  get 'topics/trouble'
  get 'topics/other'
  get 'topics/:id' => 'topics#show'
end
