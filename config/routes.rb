Rails.application.routes.draw do
  get 'invitations/:id_hash',          to: 'invitations#show'
  post 'invitations/:id_hash/reply',   to: 'invitations#reply'
  get 'invitations/:id_hash/reply' => redirect("/invitations/%{id_hash}") #validateかかった後に再読み込みされた場合対策

  resources :guests do
	  collection { post :csv_import }
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
