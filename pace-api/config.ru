require 'pace'

require_relative 'resources/messages'
require_relative 'resources/user'
Pace::Config::Database.connect(YAML.load_file('database.yml'))
use ActiveRecord::ConnectionAdapters::ConnectionManagement
use ActiveRecord::QueryCache
run Pace::API
