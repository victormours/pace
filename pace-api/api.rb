require 'grape'
require 'pace'

Pace::Config::Database.connect(YAML.load_file('database.yml'))

module Pace
  class API < Grape::API
    format :json

    desc 'The list of available messages for the user'
    params do
      optional :user_id, type: Integer, desc: "The id of the user requesting their inbox"
      optional :page
    end
    get :inbox do
      Pace::ReceivedMessages.get(1, page: params[:page] || 0)
    end

    desc 'The list of messages sent by the user'
    params do
      optional :user_id, type: Integer, desc: "The id of the user requesting their outbox"
      optional :page
    end
    get :outbox do
      Pace::SentMessages.get(1, page: params[:page] || 0)
    end

    desc 'Send a message to a user'
    params do
      requires :body, type: String, desc: 'The content of the message'
    end
    post :message do
      Pace::SendMessage.execute(
        body: params[:body],
        sender_id: 1,
        recipient_id: 2
      )
    end

  end
end
