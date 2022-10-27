Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/top'
  resources :home, only: [:mypage]
  devise_for :users
  root to: "home#top"
  get 'home/mypage'
  get 'home/show/:id', :to => 'home#show'
  
 
  resources :posts do  #postsコントローラへのルーティング  
   resources :comments, only: [:create]  #commentsコントローラへのルーティング
   resource :likes, only: [:create, :destroy]
   resource :bookmarks, only: [:create, :destroy]
  end
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :users do
     resources :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
   end
end 

