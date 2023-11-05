Rails.application.routes.draw do

  devise_for :members

  root :to => "homes#top"
  get 'about' => 'homes#about', as: 'about'

  resources :members, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    collection do  # resourcesで定義されるアクション以外を追加する(URIにidを挟まない場合はcollection)
      get "quit" # 退会確認画面
    end
    member do # resourcesで定義されるアクション以外を追加する(URIにidを挟む場合はmember)
      patch "out" => "members#out" # 退会処理
      get "followings" #フォロー一覧画面
      get "followeds" #フォロワー一覧画面
    end
  end

  resources :articles, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
