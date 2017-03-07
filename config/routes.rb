Rails.application.routes.draw do
  get 'main/index'

  # this gives the devise routes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root page is signup page
  devise_scope :user do
    root to: "main#index"
  end

  resources :users
  resources :projects

end
