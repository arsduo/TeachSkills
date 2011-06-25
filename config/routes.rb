Closeguru::Application.routes.draw do
  get "classes/offer"
  get "classes/browse"
  get "classes/search"
  get "classes/take"
  resources :users, :only => :show
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
  match "/images/uploads/*path" => "gridfs#serve"
end
