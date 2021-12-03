Rails.application.routes.draw do

  devise_for :users
  # root 'welcome#index'
  root to: 'welcome#index'
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :articles do 
    resources :comments
  end
  
  # resources :categories

  resources :categories do 
    resources :tasks
  end

  # get '/articels' => 'articles#index'

  # get '/articles/new' => 'articles#new', as: 'new_article'
  # post '/articles' => 'articles#create', as: 'create_article'

  # get '/articles/show' => 'articles#show', as: 'articles_show'

  # get '/categories' => 'categories#index'
end
