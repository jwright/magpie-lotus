resources :users, only: [:new, :create]
get "/signup", to: Web::Controllers::Users::New

redirect "/", to: "/signup"
