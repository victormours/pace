require 'grape'
require 'pace'

module Pace
  class API < Grape::API
    require_relative 'pace_api/authenticator'
    require_relative 'pace_api/messages'
    require_relative 'pace_api/users'

    mount Pace::API::Messages
    mount Pace::API::Users
  end
end

