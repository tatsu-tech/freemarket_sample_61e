Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root 'items#index'
  resources :signup do
    collection do
      get 'signup'
      get 'signup1' 
      get 'signup2'
      get 'signup3'
      get 'signup4' 
      get 'done' #登録完了ページ
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :users
end