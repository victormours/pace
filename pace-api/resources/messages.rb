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
      messages = Pace::ReceivedMessages.get(Authenticator.current_user_id, page: params[:page] || 0)
      { messages: messages }
    end

    desc 'The list of messages sent by the user'
    params do
      optional :user_id, type: Integer, desc: "The id of the user requesting their outbox"
      optional :page
    end
    get :outbox do
      messages = Pace::SentMessages.get(Authenticator.current_user_id, page: params[:page] || 0)
      { messages: messages }
    end

    desc 'Send a message to a user'
    params do
      requires :body, type: String, desc: 'The content of the message'
    end
    post :message do
      Pace::SendMessage.execute(
        body: params[:body],
        sender_id: Authenticator.current_user_id,
        recipient_id: 2
      )
    end

  end
end
