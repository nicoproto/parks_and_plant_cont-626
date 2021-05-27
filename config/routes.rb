Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:new, :create] #usually only nest to create the child instance
  end
  #shallow nesting, only create nesting routes if you need the id of the parent
  resources :plants, only: [:destroy, :show, :edit, :update] do

    # get /plants/23/plant_tags/new
    # post /plants/23/plant_tags
    resources :plant_tags, only: [:new, :create]
  end
end
