require 'yaml'
require 'pry'

module Pace
  class Console

    def self.start(database_config_file)
      new(database_config_file).start
    end

    def initialize(database_config_file)
      @database_config_hash = YAML.load_file(database_config_file)
    end

    def start
      Pace::Config::Database.connect(@database_config_hash)
      Pace.pry
    end

  end
end

