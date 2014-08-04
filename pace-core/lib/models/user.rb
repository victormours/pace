module Pace
  class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true

    has_many :sent_messages, class_name: Pace::Message, foreign_key: :sender_id
    has_many :incoming_messages, class_name: Pace::Message, foreign_key: :recipient_id
  end
end
