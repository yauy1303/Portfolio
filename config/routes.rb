Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/index'
  get 'articles/show'
  get 'members/index'
  get 'members/show'
  get 'members/edit'
  get 'members/follow'
  get 'members/follower'
  get 'members/quit'
  get 'homes/top'
  get 'homes/about'
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
