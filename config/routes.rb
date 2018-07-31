Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount ArtsyAuth::Engine => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/graphql', to: 'graphql#execute'
    get '/health', to: 'health#index'
  end
end
