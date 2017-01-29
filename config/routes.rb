Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'books/search', to: 'books#search'

  get 'books/manage', to: 'books#manage'
  post 'books/import', to: 'books#import'

  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'books#index'
end
