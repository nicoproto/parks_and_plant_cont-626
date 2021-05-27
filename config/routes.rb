Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:new, :create] #usually only nest to create the child instance
  end
  #shallow nesting, only create nesting routes if you need the id of the parent
  resources :plants, only: [:destroy, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
