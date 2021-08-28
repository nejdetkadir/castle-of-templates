Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', 
                                    sessions: 'users/sessions', 
                                    registrations: 'users/registrations'
                                  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  to:'templates#explore'
  
  # resources
  resources :templates do
    post '/like', to: 'liked#change_action', as: :like
  end

  resources :categories, only: [:show]
  
  get '/liked', to: 'liked#index', as: :liked_index
  get '/explore', to: 'templates#explore', as: :template_explore
  get 'script/:id', to: 'script#show', as: :show_script

  # errors
  get '/404', to: 'errors#not_found', as: :not_found
  get '/422', to: 'errors#unacceptable', as: :unacceptable
  get '/500', to: 'errors#internal_error', as: :internal_error
end
