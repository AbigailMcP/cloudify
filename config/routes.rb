Rails.application.routes.draw do
  resources :wordclouds, only: [:new, :create, :show]
  root 'wordclouds#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
