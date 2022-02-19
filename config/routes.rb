Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/search', to: 'contents#search', defaults: { format: :json }
      resources :contents, only: [:index, :create, :destroy, :edit]
    end
  end
end
