Closeguru::Application.routes.draw do
  # find
  get "classes/browse"
  get "classes/search"
  # participate
  get "classes/show/:id", :controller => :classes, :action => :show
  post "classes/take"
  # create
  get "classes/offer"
  post "classes/create"

  get "user/signup"
  get "user/profile"
  get "user/welcome"
   
  devise_for :users

  match "/images/uploads/*path" => "gridfs#serve"

  root :to => "home#index"
end
