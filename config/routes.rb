Rails.application.routes.draw do
  get 'users/profile2'

  root 'homepages#landing'
  get  '/profile' => 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
