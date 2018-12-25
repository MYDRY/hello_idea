# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#top'
  get '/detail' => 'home#detail'
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
      resources :likes, only: %i[create destroy]
    end
  end
  post 'topics_support/:id', to: 'topics#support', as: :support_topic

  resources :words
  resources :mandalarts
  get 'mandalarts_suggest', to: 'mandalarts#suggest', as: :suggest_mandalart
end
