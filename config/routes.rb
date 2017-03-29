Rails.application.routes.draw do
  get 'admin/hacker_list'

  devise_for :admins
  devise_for :hackers
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
