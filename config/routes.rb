Shelf::Application.routes.draw do
  root :to => "books#index"
  resources :books
end
