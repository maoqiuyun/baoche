Baoche::Application.routes.draw do
  
  resources :users do
    collection do
      get "change_password" 
    end
  end
  
  resources :home
  resources :tours
  resources :locations
  resources :orders, :except => :new do
    member do 
      get 'new', :format => "order/:tour_id/new"
    end
  end
  match '/tour/:tour_id/orders/new' => "orders#new", :as => :order_new
  
  get "sessions/index"
  post "sessions/verify"
  get "sessions/index"
  match 'logout' =>'sessions#logout', :as => :logout 
  root :to => 'sessions#index'
  
end
