Rails.application.routes.draw do
  #post 'followships/create'
  #post 'followships/destroy'
  resources:followships,only: [:create,:destroy,:update]

  #patch '/followships/accept' => 'followships#accept'
  #resources :comments
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  match 'users/:id' => 'users#show', via: :get
  # or
  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'
  # or
  resources :users, only: [:show]

  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
