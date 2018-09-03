Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update] do
    resources :posts, only: :index
  end
  get 'pages/edit_image', to: 'pages#edit_image', as: 'edit_image'
  get 'users/:id/edit_avatar', to: 'users#edit_avatar', as: 'edit_avatar'
  root 'pages#home'
  resources :posts, only: [:index, :create, :update, :destroy] do
    post 'reactions/change', to: 'reactions#change', as: 'reaction'
    resources :comments, only: [:create, :update, :delete]
  end
  resources :comments, only: :index do
    post 'reactions/change', to: 'reactions#change', as: 'reaction'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
