module Pace
  class Signup
    def self.execute(email, password)
      new(email, password).execute
    end

    def initialize(email, password)
      @email = email
      @password = password
    end

    def execute
      User.create(email: @email)
    end
  end
end
