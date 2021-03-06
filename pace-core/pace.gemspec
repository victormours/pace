Gem::Specification.new do |gem|
  gem.name        = 'pace'
  gem.version     = '0.0.0'
  gem.licenses    = ['MIT']
  gem.summary     = "Messaging for the slow web"
  gem.description = "The Postgres core for a delayed messaging app"
  gem.authors     = ["Victor Mours"]
  gem.email       = 'victor.mours@gmail.com'
  gem.files       = Dir["lib/**/*.rb"]
  gem.executables = ['pace', 'pace-console', 'pace-create-tables']

  gem.add_runtime_dependency "activerecord"
  gem.add_runtime_dependency "pg"
  gem.add_runtime_dependency "bcrypt"
  gem.add_runtime_dependency "pry"

  gem.add_development_dependency "rspec"
end
