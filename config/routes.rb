Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :cash_trackers, only:[:new, :create, :destroy]
  end

  get 'home', to: 'home#index'

   root "categories#index"

end
