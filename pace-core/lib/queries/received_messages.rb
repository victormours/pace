module Pace
  class ReceivedMessages

    def self.get(recipient_id, page: 0, page_size: 30)
      Message.where(recipient_id: recipient_id)
             .received
             .order('created_at DESC')
             .paginate(page, page_size)
    end

  end
end
