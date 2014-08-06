require 'grape'

module Pace
  class API < Grape::API

    desc 'Puts the user email in the session if the user exists'
    params do
      requires :user_email, type: String
    end
    post :login do
      user = Pace::User.find_by_email(params[:user_email])
      if user
        cookies[:user_email] = params[:user_email]
        { sucess: "You are now logged in" }
      else
        { error: "User not found" }
      end
    end


  end
end


