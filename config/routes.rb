Rails.application.routes.draw do

  root :to => "homes#top"
  get 'about' => 'homes#about', as: 'about'

  devise_for :members,  # ログイン・ログアウト・新規登録
  controllers: {        # ゲストユーザーの編集・削除制限
    registrations: "registrations"
  }

  devise_scope :member do  # ゲストログイン
    post "members/guest_sign_in", to: "sessions#guest_sign_in"
  end

  resources :members, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]                  #フォロー機能
      get "followings" => "relationships#followings", as: "followings"  #フォロー一覧画面
      get "followeds" => "relationships#followeds", as: "followeds"     #フォロワー一覧画面
    collection do   # resourcesで定義されるアクション以外を追加する(URIにidを挟まない場合はcollection)
      get "quit"    # 退会確認画面
    end
    member do  # resourcesで定義されるアクション以外を追加する(URIにidを挟む場合はmember)
      patch "out" => "members#out" # 退会処理(論理削除)
    end
  end

  resources :articles, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]  # コメント機能
    resource :favorites, only: [:create, :destroy]  # いいね機能
    collection do
      get "search"
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
