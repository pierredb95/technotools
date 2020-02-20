Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vinyls do
    resources :bookings, except: [ :index, :show, :destroy, :edit, :update]
  end
  resources :bookings, only: [ :index, :show, :destroy, :edit, :update] do
    resources :reviews, only: [ :new, :create, :edit, :update]
  end

  resources :artists, only: [ :new, :create]

end
