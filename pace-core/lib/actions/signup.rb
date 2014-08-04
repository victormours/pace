module Pace
  class Signup
    def self.execute(email)
      new(email).execute
    end

    def initialize(email)
      @email = email
    end

    def execute
      User.create(email: @email)
    end
  end
end
