Rails.application.routes.draw do
    root to: 'tasks#index'

    resources :tasks
    
    get 'signup', to: 'users#new'
    
    resources :users, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
