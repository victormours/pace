module Chaplin
  class Server

    def initialize(api_url)
      @router = Router.new("routes.json")
      @renderer = Renderer.new(api_url)
    end

    def call(rack_env)
      request = Rack::Request.new(rack_env)
      template_name = @router.template_for(request)
      if template_name
        response_body = @renderer.render(request, template_name)

        status = 200
        headers = {}
        body = [response_body]

        [status, headers, body]
      else
        [404, {}, ["Not found"]]
      end
    end

  end
end
