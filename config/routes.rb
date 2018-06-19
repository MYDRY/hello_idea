Rails.application.routes.draw do
  get 'post/index'
  get 'home/top'
  root 'home#top'
  get 'post/ideal'
  get 'post/trouble'
  get 'post/other'
  get 'post/:id' => 'post#show'
end
