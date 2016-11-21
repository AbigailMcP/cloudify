Rails.application.routes.draw do
  post '/cloud', to: 'wordclouds#post_cloud'
  get '/cloud', to: 'wordclouds#get_cloud'
  root 'wordclouds#new'
end
