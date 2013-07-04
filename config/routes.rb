Sam::Application.routes.draw do
  namespace :admin do
    resources :users
    resources :organisations
  end
  resources :users, :user_sessions,:authorizations,:omnicontacts
  resources :accounts, :controller=>"users"
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match "/auth/:provider/callback"=>"authorizations#create"  
  match "/auth/failure" =>"authorizations#failure"
  match "/auth/:provider"=> "authorizations#blank"
end
