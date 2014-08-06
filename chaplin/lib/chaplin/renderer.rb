require 'mustache'
require_relative 'forwarder.rb'

module Chaplin
  class Renderer

    TEMPLATES_PATH = 'templates/'

    def initialize(api_url)
      @api_url = api_url
      @forwarder = Forwarder.new(api_url)
    end

    def render(request, template_name)
      page = Mustache.new
      page.template_file = TEMPLATES_PATH + template_name

      forwarder = Forwarder.new('localhost:8080')
      api_data = @forwarder.forward(request, session)

      page.render(api_data)
    end

  end
end
