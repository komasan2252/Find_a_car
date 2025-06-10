Rails.application.routes.draw do
  devise_for :users, path: "/", controllers: {
    registrations: "public/users/registrations",
    sessions: "public/users/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :posts, only: [:new, :create, :edit, :update]
    end
    resources :posts, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
