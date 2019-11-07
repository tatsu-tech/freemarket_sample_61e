Rails.application.routes.draw do
  devise_for :users
  root 'users#profile'
  resources :users do
    member do
      get 'mypage'
      get 'mypage/notification'
      get 'mypage/todo'
      get 'mypage/like/history'
      get 'mypage/listings/listing'
      get 'mypage/listings/in_progress'
      get 'mypage/listings/completed'
      get 'mypage/purchase'
      get 'mypage/purchased'
      get 'mypage/news'
      get 'mypage/review/history'
      get 'mypage/support'
      get 'mypage/sales'
      get 'mypage/point'
      get 'mypage/profile'
      get 'mypage/deliver_address'
      get 'mypage/card'
      get 'mypage/email_password'
      get 'mypage/identification'
      get 'mypage/sms_confirmation'
    end
  end
end
