Rails.application.routes.draw do
  post '/cloud', to: 'wordclouds#cloud'
  get '/show_cloud', to: 'wordclouds#show_cloud'
  root 'wordclouds#new'
end
