module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      param :user do
        param :email, presence: true, format: /@/
        param :username, presence: true
        param :name, presence: true
        param :password, presence: true, confirmation: true
      end
    end

    def call(params)
      if params.valid?
        @user = UserRepository.create User.new(params[:user])
        redirect_to routes.lists_path
      end
    end
  end
end
