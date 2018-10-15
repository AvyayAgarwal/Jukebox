Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#start'
  get '/auth/spotify/callback', to: 'users#index'
end
