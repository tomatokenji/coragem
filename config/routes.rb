Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/about'

  get 'main/index'

  # this gives the devise routes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root page is signup page
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users
  resources :projects

end
