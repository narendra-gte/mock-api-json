Rails.application.routes.draw do
  resources :businesses
  root 'pages#main'
end
