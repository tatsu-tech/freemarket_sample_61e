Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  get 'users/mypage'
  get 'users/identification'
  get 'users/profile'
  get 'users/logout'
  get 'users/new'
  get 'users/new0'
  get 'users/new1'
  get 'users/new2'
  get 'users/new3'
  get 'users/new4'
  get 'users/new5'
  # resources :users do
  #   member do
  #     get 'mypage'
  #     get 'mypage/notification'
  #     get 'mypage/todo'
  #     get 'mypage/like/history'
  #     get 'mypage/listings/listing'
  #     get 'mypage/listings/in_progress'
  #     get 'mypage/listings/completed'
  #     get 'mypage/purchase'
  #     get 'mypage/purchased'
  #     get 'mypage/news'
  #     get 'mypage/review/history'
  #     get 'mypage/support'
  #     get 'mypage/sales'
  #     get 'mypage/point'
  #     get 'mypage/profile'
  #     get 'mypage/deliver_address'
  #     get 'mypage/card'
  #     get 'mypage/email_password'
  #     get 'mypage/identification'
  #     get 'mypage/sms_confirmation'
  #   end
  # end
end
