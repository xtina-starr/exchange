require 'sidekiq/web'
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount ArtsyAuth::Engine => '/'
  constraints ->(req) { req.session[:access_token].present? && ArtsyAuthToken.new(req.session[:access_token]).admin? } do
    mount Sidekiq::Web, at: '/admin/sidekiq'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/graphql', to: 'graphql#execute'
    get '/health', to: 'health#index'
  end
  resources :admin_notes
end
