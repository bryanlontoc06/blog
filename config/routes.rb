Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :articles
  resources :category

  # get '/articles' => 'articles#index'

  # get '/articles/new' => 'articles#new', as: 'new_article'
  # post '/articles' => 'articles#create', as: 'create_article'

  # get '/articles/show' => 'articles#show', as: 'articles_show'

  # get '/categories' => 'categories#index'
end
