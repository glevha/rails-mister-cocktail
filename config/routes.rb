Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
  	resources :reviews, only: [ :new, :create, :delete ]
  end
end
