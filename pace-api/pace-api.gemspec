Gem::Specification.new do |gem|
  gem.name        = 'pace-api'
  gem.version     = '0.0.0'
  gem.licenses    = ['MIT']
  gem.summary     = "The JSON API for Pace, a delayed messaging application"
  gem.description = "This is an application-size adapter around the pace-core gem"
  gem.authors     = ["Victor Mours"]
  gem.email       = 'victor.mours@gmail.com'
  gem.files       = Dir["lib/**/*.rb"]
  gem.executables = ['pace-api']

  gem.add_runtime_dependency "rack"
  gem.add_runtime_dependency 'pace', '0.0.0', path: File.expand_path(File.dirname(__FILE__) + '/../pace-core')

  gem.add_development_dependency "rspec"
end
