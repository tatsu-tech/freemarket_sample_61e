Rails.application.routes.draw do
  devise_for :users

  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :myitems, only: [:index, :show, :edit, :update, :destroy]

  resources :users do
    member do
      get 'mypage'
      get 'mypage/notification'
      get 'mypage/todo'
      get 'mypage/like/history'
      get 'users/listing'
      get 'users/in_progress'
      get 'users/completed'
      get 'users/purchase'
      get 'users/purchased'
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
      get 'users/logout'
    end
  end

  resources :signup do
    collection do
      get 'signup'
      get 'signup1'
      get 'signup2'
      get 'signup3'
      get 'signup4'
      get 'done'
    end
  end

  resources :cards, only: [:new, :show, :edit] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :transactions do
    collection do
      post 'pay' => 'transactions#pay', as: 'pay'
      get 'result' => 'transactions#result'
    end
  end
  
end

