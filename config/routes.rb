Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :cash_trackers, only:[:index, :show, :new, :create, :destroy]
  end
   root "categories#index"
end
