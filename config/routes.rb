Rails.application.routes.draw do
  get 'invitations/:id_hash', to: 'invitations#show'
  post 'invitations/reply'

  resources :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
