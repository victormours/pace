module Pace
  class Message < ActiveRecord::Base

    ARRIVAL_DELAY_HOURS = 24

    belongs_to :sender, class_name: Pace::User
    belongs_to :recipient, class_name: Pace::User

    validates :body, presence: true
    validates :sender, presence: true
    validates :recipient, presence: true

    scope :received, -> { where("created_at > ?", visibility_threshold) }
    scope :paginate, ->(page, page_size) {
      limit(page_size).offset(page*page_size)
    }

    scope :visible_by, ->(user_id) {
      where("sender_id = ? OR  (recipient_id = ? AND created_at > ?)",
            user_id,
            user_id,
            visibility_threshold
           )
    }

    def self.visibility_threshold
      ARRIVAL_DELAY_HOURS.hours.ago
    end

  end
end
