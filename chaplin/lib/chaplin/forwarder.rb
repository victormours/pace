require 'net/http'
require 'json'

module Chaplin
  class Forwarder

    def initialize(api_url)
      @api_url = api_url
    end

    def forward(request)
      response = ''
      case request.request_method
      when 'GET'
        response = Net::HTTP.get(uri(request))
      end

      JSON.parse(response)
    end

    private

    def uri(request)
      URI('http://' + @api_url + request.path)
    end
  end
end
