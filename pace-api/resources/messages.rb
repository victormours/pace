require 'grape'

require_relative '../authenticator'
module Pace
  class API < Grape::API
    format :json

    desc 'The list of available messages for the user'
    params do
      optional :user_id, type: Integer, desc: "The id of the user requesting their inbox"
      optional :page
    end
    get :inbox do
      current_user_id = Authenticator.current_user_id(cookies)
      messages = Pace::ReceivedMessages.get(current_user_id, page: params[:page] || 0)
      { messages: messages }
    end

    desc 'The list of messages sent by the user'
    params do
      optional :user_id, type: Integer, desc: "The id of the user requesting their outbox"
      optional :page
    end
    get :outbox do
      current_user_id = Authenticator.current_user_id(cookies)
      messages = Pace::SentMessages.get(current_user_id, page: params[:page] || 0)
      { messages: messages }
    end

    desc 'Send a message to a user'
    params do
      requires :body, type: String, desc: 'The content of the message'
    end
    post :message do
      current_user_id = Authenticator.current_user_id(cookies)
      Pace::SendMessage.execute(
        body: params[:body],
        sender_id: current_user_id,
        recipient_id: 2
      )
    end

  end
end
