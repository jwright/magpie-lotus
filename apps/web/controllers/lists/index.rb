module Web::Controllers::Lists
  class Index
    include Web::Action
    before :authenticate!

    def call(params)
    end

    private

    def authenticate!
      require_login do
        redirect_to routes.signin_path
      end
    end
  end
end
