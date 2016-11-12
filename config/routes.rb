Rails.application.routes.draw do
  get 'wordcloud/new'

  get 'wordcloud/create'

  get 'wordcloud/show'

  root 'wordcloud#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
