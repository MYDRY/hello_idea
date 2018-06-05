Rails.application.routes.draw do
  get 'post/index'
  get 'home/top'
  root 'home#top'
end
