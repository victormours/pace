module Pace
  class SingleMessage

    def self.get(id, requester_id)
      Message.visible_by(requester_id).find(id)
    end

  end
end


