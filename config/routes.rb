Rails.application.routes.draw do
  resources :tags
  resources :tag_categories
  resources :purchase_options do
    collection do
      get :get_purchase_options_of_product
    end
  end

  resources :fine_prints do
    collection do
      get :get_fine_print_of_product
    end
  end
  resources :products
  root 'pages#main'
  match "/products"=>"products#create", :via=>["POST","OPTIONS"]
end
