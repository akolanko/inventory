Inventory::Application.routes.draw do

  root to: "home#index"
  resources :users
  resources :categories do
    resources :products do
      resources :sales
      resources :locations
      resources :listings
    end
  end
  get "/products" => "products#index", as: :products
  get "/signin" => "sessions#new", as: :signin
  post "/signin" => "sessions#create", as: :new_session
  delete "/signout" => "sessions#destroy", as: :signout
  get "/instock" => "products#instock", as: :instock
  get "/soldout" => "products#soldout", as: :soldout

end
