Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :students, only: [:index, :show, :edit, :update, :new, :create]
  get '/results', to: 'students#results', as: :public_results
end
