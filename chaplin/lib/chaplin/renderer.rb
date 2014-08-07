require 'mustache'
require_relative 'forwarder.rb'

module Chaplin
  class Renderer

    def initialize(templates_path)
      @templates_path = templates_path
    end

    def render(json_data, template_name)
      page = Mustache.new
      page.template_file = @templates_path + template_name
      page.render(json_data)
    end

  end
end
