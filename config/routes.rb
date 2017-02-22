Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :events do
    resources :bookings, only: [ :new, :create ]
  end
  resources :localisations, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

