Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'pages#index'
  get 'marketing', to: 'pages#marketing'
  get 'development', to: 'pages#development'

  resources :articles

end
