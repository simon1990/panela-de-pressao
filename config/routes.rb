ManifesteSe::Application.routes.draw do

  match '/auth/:provider/callback',   :to => 'sessions#create'
  get '/auth/facebook', as: :facebook_connect
  get '/auth/meurio',   as: :meurio_connect

  resources :sessions, :only => [:destroy]
  resources :organizations, only: [:new, :index, :show, :create]
  resources :campaigns, :only => [:index, :show, :new, :create, :edit, :update] do
    put :accept, :to => "campaigns#accept"
    resources :posts, :only => [:create, :index, :destroy]
    resources :pokes, :only => [:create] do
      collection do
        get :create_from_session, :to => "pokes#create"
      end
    end
  end
  resources :influencers, :only => [:index, :create]
  resources :users, only: [:show, :update]
  root :to => 'campaigns#index'
end
