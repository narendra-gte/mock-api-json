Rails.application.routes.draw do
  resources :tags
  resources :tag_categories
  resources :purchase_options
  resources :fine_prints
  resources :products
  root 'pages#main'
  match "/products"=>"products#create", :via=>["POST","OPTIONS"]
end
