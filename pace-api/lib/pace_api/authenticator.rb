module Pace
  class API
    class Authenticator

      def self.sign_in(user, cookies)
        cookies[:user_email] = user.email
      end

      def self.sign_out(cookies)
        cookies.delete(:user_email)
      end

      def self.current_user(cookies)
        Pace::User.find_by_email(cookies[:user_email])
      end

      def self.current_user_id(cookies)
        current_user(cookies).try(:id)
      end

    end
  end
end
