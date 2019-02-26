Rails.application.routes.draw do
  Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
  end  

  root controller: :chat, action: :index
  devise_for :users
  resources :chat, only: [:index, :show]
  resources :message, only: [:create]
end
