module Chaplin
  class Handler
    def handle_request(rack_env)
      new(rack_env).handle_request
    end

    def initialize(rack_env)
      @request = Rack::Request.new(rack_env)
    end

    def handle_request
    end
  end
end
