Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :signup do
    collection do
      get 'signup'
      get 'signup1' 
      get 'signup2'
      get 'signup3'
      get 'signup4' 
      get 'signup5' #登録完了ページ
    end
  end
end