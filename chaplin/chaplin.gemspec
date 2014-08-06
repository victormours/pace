Gem::Specification.new do |gem|
  gem.name        = 'chaplin'
  gem.version     = '0.0.0'
  gem.licenses    = ['MIT']
  gem.summary     = "Mustache-powered application-size decorator for your JSON hypermedia api"
  gem.description = "Chaplin(JSON hypermedia API, Mustache templates) == HTML web app"
  gem.authors     = ["Victor Mours"]
  gem.email       = 'victor.mours@gmail.com'
  gem.files       = Dir["lib/**/*.rb"]
  gem.executables = ['chaplin']

  gem.add_runtime_dependency "rack"
  gem.add_runtime_dependency "mustache"
  gem.add_runtime_dependency "pry"

  gem.add_development_dependency "rspec"
end
