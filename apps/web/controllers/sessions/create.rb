module Web::Controllers::Sessions
  class Create
    include Web::Action

    params do
      param :user do
        param :email, presence: true, format: /@/
        param :password, presence: true
      end
    end

    def call(params)
      result = Login.new(params).call
      if result.success?
        auto_login result.user
        redirect_to routes.lists_path
      end
    end
  end
end
