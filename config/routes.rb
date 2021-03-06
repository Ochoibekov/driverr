Rails.application.routes.draw do
  devise_for :users
  root "drivers#index"
  get "user/edit/:id", to: "users#edit", as: :edit_user
  put "user/update/:id", to: "users#update", as: :update_user
  get "drivers/new"
  get "users/new"
  get "users/index", to: "users#index", as: :users
  post "users/create"
  get "driver/:id", to: "drivers#show", as: :drivers_show
  post "drivers/create"
  post "drivers/comment_create"
  get "drivers/:id/comment_new", to: "drivers#comment_new",as: :drivers_comment_new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
