Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # post 'user_token' => 'user_token#create'
  post '/auth/login', to: 'authentication#login'
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  get    '/users/show'  => 'users#show'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'
  
  namespace 'api' do
  	namespace 'v1' do
  		resources :scratchers
  	end
  end
end
