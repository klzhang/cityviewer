Rails.application.routes.draw do
  root "main#index"
  get '/cities/view', to: 'cities#viewcity'
  get '/cities/new', to: 'cities#newcity'
  get '/cities/update', to: 'cities#updateget'
  post '/cities/create', to: 'cities#create'
  post '/cities/update', to: 'cities#updatepost'
end
