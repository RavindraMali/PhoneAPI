Rails.application.routes.draw do
  resources :phone, :only => [:index, :create]
end
