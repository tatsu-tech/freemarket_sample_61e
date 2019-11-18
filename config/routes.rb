Rails.application.routes.draw do

  devise_for :users,controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    member do
      get 'purchase'
    end
    collection do
      get 'searched'
    end
  end
  resources :myitems, only: [:index, :show, :edit, :update, :destroy]

  resources :users do
    member do
      get 'users/mypage'
      get 'users/notification'
      get 'users/todo'
      get 'users/like/history'
      get 'users/listing'
      get 'users/in_progress'
      get 'users/completed'
      get 'users/purchase'
      get 'users/purchased'
      get 'users/news'
      get 'users/review/history'
      get 'users/support'
      get 'users/sales'
      get 'users/point'
      get 'users/profile'
      get 'users/deliver_address'
      get 'users/card'
      get 'users/email_password'
      get 'users/identification'
      get 'users/sms_confirmation'
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
      get 'sns'
    end
  end

  resources :cards, only: [:new, :show, :edit] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'add', to: 'cards#add'
      post 'delete', to: 'cards#delete'
      get  'edit1'
      get  'edit2'
    end
  end

  resources :transactions do
    collection do
      post 'pay' => 'transactions#pay', as: 'pay'
      get 'result' => 'transactions#result'
    end
  end
  
end

