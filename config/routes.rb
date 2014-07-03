Inventory::Application.routes.draw do

  get "tags/index"
  get "tags/new"
  get "tags/search"
  root to: "home#index"
  resources :users
  resources :categories do
    resources :products do
      resources :sales
      resources :locations
      resources :listings
      resources :tags
    end
    get "/instock" => "categories#instock"
    get "/soldout" => "categories#soldout"
  end
  get "/products" => "products#all"
  get "/signin" => "sessions#new", as: :signin
  post "/signin" => "sessions#create", as: :new_session
  delete "/signout" => "sessions#destroy", as: :signout
  get "/instock" => "products#instock"
  get "/soldout" => "products#soldout"
  get "/locations" => "locations#all"
  get "/locations/search" => "locations#search"
  get "/listings" => "listings#all"
  get "/listings/search" => "listings#search"
  get "/sales" => "sales#all"
  get "/sales/search" => "sales#search"
  get "/tags/search" => "tags#search"

end
