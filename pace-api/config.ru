
require 'pace'

require_relative 'authenticator'
require_relative 'resources/messages'
require_relative 'resources/user'
Pace::Config::Database.connect(YAML.load_file('database.yml'))
run Pace::API
