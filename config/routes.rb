Crowdfunder::Application.routes.draw do
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :projects do
    resources :pledges :only => [:new, :create]
  end

  resources :users, except: [:index]

  # Sign in and sign out actions
  resource :session, :only => [:new, :create, :destroy]
  
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end