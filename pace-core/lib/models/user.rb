module Pace
  class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true

    has_many :messages, class_name: Pace::Message
  end
end
