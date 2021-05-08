Rails.application.routes.draw do
  get 'searchs/search'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => "searchs#search"
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :followings,:followers
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end