Rails.application.routes.draw do

#this will take us to the homepage on opening the application
root :to => 'books#index'

  resources :users do
    resources :books
  end

  resources :books do
    resources :reviews
  end

end
