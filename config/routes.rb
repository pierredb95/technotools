Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vinyls do
    resources :bookings, except: [ :index, :show, :destroy, :edit, :update]
    resources :reviews, except: [ :index, :show ]
  end
  resources :bookings, only: [ :index, :show, :destroy, :edit, :update]
end
