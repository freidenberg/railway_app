Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post '/home/guest_sign_in', to: 'home#guest_sign_in'
  get 'home/top'
  resources :home, only: [:mypage]
 

 get "profile/edit", to: "profiles#edit", as: "edit_profile"
 patch "/profiles", to: "profiles#update"
 


  get "posts/:id/edit" => "posts#edit"
  #post  "posts/:id/update" => "posts#update"
  #post  "posts/:id/destroy" => "posts#destroy"
  resources :posts, only: [:update,:destroy]

  devise_for :users
  root to: "home#top/:id", :to => 'home#top'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :inbox]
  get 'home/mypage/:id', :to => 'home#mypage',  as: :mypage 
  get 'home/user/:id', :to => 'home#user', as: :userpage 
  #get 'home/mypage'
  get 'home/show/:id', :to => 'home#show'
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :posts do  #postsコントローラへのルーティング  
   resources :comments, only: [:create]  #commentsコントローラへのルーティング
   resource :likes, only: [:create, :destroy]
   resource :bookmarks, only: [:create, :destroy]
  end
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end 

