Crowdfunder::Application.routes.draw do
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :projects do # '/projects/2'
    resources :pledges, :only => [:new, :create] # '/projects/2/pledges/new'
  end

  # Adds a prefix to the url: '/my/projects/2' etc.
  namespace :my do
    resources :projects, :except => [:show] do
      resources :images
    end
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