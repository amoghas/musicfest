Rails.application.routes.draw do
  root to: 'pages#show', id: 'home'
  # root "events#public_view"
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'

  resources :events
  devise_for :users do  
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
