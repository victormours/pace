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
      when 'POST'
        response = Net::HTTP.post_form(uri(request), request.params).body
      end

      JSON.parse(response)
    end

    private

    def uri(request)
      URI('http://' + @api_url + request.path)
    end
  end
end
