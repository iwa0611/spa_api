Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/search', to: 'contents#search', defaults: { format: :json }
      post '/search_index', to: 'contents#search_index', defaults: { format: :json }
      resources :contents, only: [:index, :create, :destroy, :update, :show]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
