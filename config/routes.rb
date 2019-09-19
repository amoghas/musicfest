Rails.application.routes.draw do
  root to: 'pages#show', id: 'home'
  # root "events#public_view"
  # resources :pages, controller: 'pages', only: [:show]

  resources :events do 
    collection do
       get "public_view" => 'events#public_view' 
    end
  end
  devise_for :users do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
