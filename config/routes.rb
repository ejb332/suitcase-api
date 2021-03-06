Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get '/destinations' => 'destinations#index'
    post '/destinations' => 'destinations#create'
    get '/destinations/:id' => 'destinations#show'
    patch '/destinations/:id' => 'destinations#update'
    delete '/destinations/:id' => 'destinations#destroy'

    get '/attire' => 'attires#index'
    post '/attire' => 'attires#create'

    get '/users/:id' => 'users#show'
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    post '/sessions' => 'sessions#create'
  end
end
