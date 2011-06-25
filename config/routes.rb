Closeguru::Application.routes.draw do
  get "classes/offer"
  get "classes/browse"
  get "classes/search"
  get "classes/take"

  get "user/signup"
  get "user/profile"
  get "user/welcome"
   
  devise_for :users

  match "/images/uploads/*path" => "gridfs#serve"

  root :to => "home#index"
end
