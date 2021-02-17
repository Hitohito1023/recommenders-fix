Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'home#start'
  get 'home/top' => 'home#top'
  get 'home/ranking' => 'home#ranking'

  get 'search/search'
  get '/search', to: 'search#search'

  get 'post_items/complete' => 'post_items#complete', as: 'post_items_complete'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'users_unsubscribe'
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'users_withdraw'
  put 'users/:id/withdraw' => 'users#withdraw'
  get '/thanks' => 'users#thanks', as: 'thanks'


  resources :post_items do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :genres, only: [:create, :update, :destroy]
end
