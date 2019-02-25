Rails.application.routes.draw do
  devise_for :users
  Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
  end
  resources :chat, only: [:index]
end
