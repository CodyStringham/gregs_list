Rails.application.routes.draw do

  root 'site#index'

  devise_for :users

  resources :games do
    resources :events do
      resources :posts
    end
  end

    resources :users

end
