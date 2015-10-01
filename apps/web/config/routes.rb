resources :lists, only: :index

resources :sessions, only: [:new, :create, :destroy]
get "/signin", to: Web::Controllers::Sessions::New, as: :signin
delete "/signout", to: "sessions#destroy", as: :signout

resources :users, only: [:new, :create, :show]
get "/signup", to: Web::Controllers::Users::New, as: :signup

redirect "/", to: "/signup"
