Rails.application.routes.draw do
  
  resources :students do
    resources :projects, only: [:index]
  end

  resources :projects

  get '/search', to: 'projects#index'
 
  root 'home#show'

end
