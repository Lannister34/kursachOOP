Rails.application.routes.draw do
  root 'page#home' 
  post '/' => 'page#create'

  get 'about' => 'page#about'
  get 'create' => 'users#new'
  

  get 'signup' => 'activates#new'
  post 'signup' => 'activates#log'

  get 'login' => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get 'themes/:id/create_lecture', to: 'themes#new', as: 'create_lecture'
  post 'themes/:id/create_lecture', to: 'themes#create'
  patch 'articles/:id/edit', to: 'articles#update'

  get 'tests/create_test', to: 'tests#new', as: 'create_test'
  post 'tests/create_test', to: 'tests#create'
  get 'tests/create_test', to: 'tests#edit'
  patch 'tests/create_test', to: 'tests#update'

  get 'tests/:id/', to: 'tests#show', as: 'show_test'
  post 'tests/:id/', to: 'tests#check' 
 
  get 'tests/:id/add_question', to: 'tests#edit', as: 'add_question'
  patch 'tests/:id/add_question', to: 'tests#update'

  resources :users
  resources :activates
  resources :articles
  resources :themes
  resources :tests
end
