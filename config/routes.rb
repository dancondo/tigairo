Rails.application.routes.draw do
  root 'pages#home'
  resources :posts, only: [:index, :create, :update, :delete]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
