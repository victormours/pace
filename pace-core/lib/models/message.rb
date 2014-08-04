module Pace
  class Message < ActiveRecord::Base
    belongs_to :sender, class_name: Pace::User
    belongs_to :recipient, class_name: Pace::User

    validates :body, presence: true
    validates :sender, presence: true
    validates :recipient, presence: true
  end
end
