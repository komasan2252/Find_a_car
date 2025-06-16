Rails.application.routes.draw do
  
  devise_for :users, path: "/", controllers: {
    registrations: "public/users/registrations",
    sessions: "public/users/sessions"
  }

  devise_for :admins, path: "admin", controllers: {
    sessions: "admin/admins/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :posts, only: [:new, :create, :edit, :update]
    end
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:create]
    end
    resources :comments, only: [:destroy]
  end
  
  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy]
  end
end
