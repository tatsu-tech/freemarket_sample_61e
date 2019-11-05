Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  get 'mypage' => 'users#mypage'
end
