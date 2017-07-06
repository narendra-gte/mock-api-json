Rails.application.routes.draw do
  resources :products
  resources :businesses
  resources :owners
  resources :categories
  root 'pages#main'
end
