require 'grape'

require_relative '../authenticator'
module Pace
  class API < Grape::API

    desc 'Puts the user email in the session if the user exists'
    params do
      requires :user_email, type: String
    end
    post :login do
      user = Pace::User.find_by_email(params[:user_email])
      if user
        Authenticator.sign_in(user, cookies)
        { sucess: "You are now logged in" }
      else
        { error: "User not found" }
      end
    end

    post :logout do
      Authenticator.sign_out(cookies)
      { success: "You logged out" }
    end

    desc 'The profile of the logged in user'
    get :profile do
      { user: Authenticator.current_user(cookies) }
    end


  end
end


