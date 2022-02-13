Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :contents, only: [:index, :create, :destroy, :edit], defaults: { format: :json }
    end
  end
end
