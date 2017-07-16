Rails.application.routes.draw do
  root 'homepages#landing'

  devise_for :users, path: '/', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }, path_names: {
    sign_up: 'register',
    cancel: 'deregister',
    sign_in: 'login',
    sign_out: 'logout',
    edit: 'account',
  }

  resources :interests, only: [:create, :destroy]
  resources :specialties, only: [:create, :destroy]
  resources :users, only: [:show, :index]
  get 'search/tags/:id' => 'interests#search', as: :interest_search
end
