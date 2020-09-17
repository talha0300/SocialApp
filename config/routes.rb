Rails.application.routes.draw do

  resources:followships,only: [:create,:destroy,:update]
  resources:notifications,only:[:index,:show,:destroy]

  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users,controllers: { confirmations: 'confirmations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end



  resources :users, only: [:show,:index]

  get 'home/index'
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
