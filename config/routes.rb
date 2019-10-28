Rails.application.routes.draw do
  devise_for :users
  root "drivers#index"
  get "drivers/new"
  get "driver/:id", to: "drivers#show", as: :drivers_show
  post "drivers/create"
  post "drivers/comment_create"
  get "drivers/:id/comment_new", to: "drivers#comment_new",as: :drivers_comment_new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
