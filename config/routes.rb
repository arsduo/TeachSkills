Closeguru::Application.routes.draw do
  get "classes/offer"
  get "classes/browse"
  get "classes/search"
  get "classes/take"
  post "classes/new"

  get "user/signup"
  get "user/profile"
  get "user/welcome"

  root :to => "home#index"
  devise_for :users#, :controllers => { :registrations => "registrations" }

  match "/images/uploads/*path" => "gridfs#serve"
end
