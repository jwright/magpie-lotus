module Web::Controllers::Sessions
  class Destroy
    include Web::Action

    def call(params)
      logout!
      redirect_to routes.signin_path
    end
  end
end
