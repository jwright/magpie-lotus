resources :users, only: [:new]
get "/signup", to: Web::Controllers::Users::New

redirect "/", to: "/signup"
