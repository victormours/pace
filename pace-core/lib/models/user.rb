require 'bcrypt'

module Pace
  class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true

    has_many :sent_messages, class_name: Pace::Message, foreign_key: :sender_id
    has_many :incoming_messages, class_name: Pace::Message, foreign_key: :recipient_id

    def password
      @password ||= BCrypt::Password.new(password_hash)
    end

    def password=(new_password)
      @password = BCrypt::Password.create(new_password)
      self.password_hash = @password
    end
  end
end
