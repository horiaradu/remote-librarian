Rails.application.routes.draw do
  get 'books/search', to: 'books#search'
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'books#index'
end
