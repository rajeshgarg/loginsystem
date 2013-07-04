Sam::Application.routes.draw do
  namespace :admin do
    resources :users
    resources :organisations
  end
  resources :users, :user_sessions,:authorizations

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match "/auth/:provider/callback"=>"authorizations#create"  
  match "/auth/failure" =>"authorizations#failure"
  match "/auth/:provider"=> "authorizations#blank"
end
