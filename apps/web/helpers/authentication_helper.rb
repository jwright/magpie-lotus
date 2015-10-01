module Web
  module Helpers
    module Authentication
      def auto_login(user)
        session[:user_id] = user.id
        @current_user = user
      end

      def current_user
        @current_user || login_from_session
      end

      def logged_in?
        !!current_user
      end

      def login_from_session
        UserRepository.find session[:user_id] if session[:user_id]
      end
    end
  end
end
