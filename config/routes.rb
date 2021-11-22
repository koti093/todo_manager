Rails.application.routes.draw do
  #get "todos",to:"todos#index"
  get "/" => "home#index"
  resources :todos
end
