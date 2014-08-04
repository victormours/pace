module Pace
  class SendMessage

    def self.execute(body:, sender_id:, recipient_id:)
      new(body, sender_id, recipient_id).execute
    end

    def initialize(body, sender_id, recipient_id)
      @body = body
      @sender_id = sender_id
      @recipient_id = recipient_id
    end

    def execute
      Message.create(
        body: @body,
        sender_id: @sender_id,
        recipient_id: @recipient_id
      )
    end
  end
end
