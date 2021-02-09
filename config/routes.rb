Rails.application.routes.draw do

  namespace :user do
    get 'cart_items/index'
  end
  # =======================================ユーザー側=================================================
   devise_for :users, path: :user, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }

  scope module: :user do
    root to: 'homes#top'
    get 'homes/about' => "homes#about"
    resources :users, only: [:show, :edit, :update]
     # 検索機能
     get 'search' => 'search#search'
  end

  namespace :user do
    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    get 'orders/thanks'
    resources :orders do
      collection do
        post 'confirm'
      end
    end
    resources :genres, only: [:show]
    delete 'cart_items/all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    
  end
 # =======================================ユーザー側(終)=================================================



 # =======================================アドミン側=================================================
  devise_for :admins,  path: :admin, :controllers => {
    :sessions => 'admins/sessions', 
    :registrations => 'admins/registrations',
    :passwords => 'admins/passwords'
  }

  scope module: :admin do
    get 'admin_homes/top'
    resources :admins, only: [:index]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end
 # =======================================アドミン側(終)=================================================
end
