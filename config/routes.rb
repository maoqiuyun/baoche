Baoche::Application.routes.draw do
  
  resources :users do
    member do 
      get "reset_passwowrd"
    end
    collection do
      get "change_password"
    end
  end
  
  resources :home
  resources :tours
  resources :locations
  resources :orders do 
    member do 
      get "logs"
    end 
  end
  
  get "sessions/index"
  post "sessions/verify"
  get "sessions/index"
  match 'logout' =>'sessions#logout', :as => :logout 
  root :to => 'sessions#index'
  
end
