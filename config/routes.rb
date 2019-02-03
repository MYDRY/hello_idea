# frozen_string_literal: true

Rails.application.routes.draw do
  get 'mandal_ideas/index'
  get 'mandal_ideas/create'
  root 'home#top'
  get '/tools' => 'home#tools'
  post 'topics/classfy_topic'
  get '/login' => 'users#login'
  post '/login' => 'users#check_user'
  get '/logout' => 'users#logout'

  resources :users, shallow: true do
    resources :notices, except: :create
  end
  get 'notices/:id/mark', to: 'notices#mark', as: :mark_notice
  get 'notices/:user/markall', to: 'notices#mark_all', as: :mark_notice_all
  delete 'notices/:user/delete', to: 'notices#destroy_has_read', as: :delete_notice_has_read

  resources :topics, shallow: true do
    resources :invests, only: %i[create update]
    resources :ideas do
    end
  end
  post 'topics_support/:id', to: 'topics#support', as: :support_topic

  post   '/like', to: 'likes#create',  as: 'likes'
  delete '/like', to: 'likes#destroy', as: 'like'

  resources :words
  post '/mandalarts/suggest' => 'mandalarts#suggest'
  resources :mandalarts
  resources :random_words_ideas
  resources :mandal_ideas
  resources :seas

  get '*path' => 'application#render_404'
end
