Closeguru::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  resources :users, :only => :show
  match "/images/uploads/*path" => "gridfs#serve"
end
