module Pace
  class SentMessages

    def self.get(sender_id, page: 0, page_size: 30)
      Message.where(sender_id: sender_id)
             .order('created_at DESC')
             .paginate(page, page_size)
    end

  end
end
