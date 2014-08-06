module Chaplin
  class Server

    def initialize
      @router = Router.new("routes.json")
      @renderer = Renderer.new
    end

    def call(rack_env)
      puts "receiving request"
      request = Rack::Request.new(rack_env)
      template_name = @router.template_for(request)
      puts "templates: #{template_name}"
      response_body = ''
      if template_name
        response_body = @renderer.render(request, template_name)
      end
      puts "response_body: #{response_body}"

      status = 200
      headers = {}
      body = [response_body]

      [status, headers, body]
    end

  end
end
