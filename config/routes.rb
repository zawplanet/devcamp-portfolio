Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  devise_scope :user do  
   get '/logout' => 'devise/sessions#destroy'     
  end

  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: "portfolio_show"
  get 'angular-items', to: "portfolios#angular"

  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

root to: 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
