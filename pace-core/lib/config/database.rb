require 'pg'
require 'active_record'

module Pace::Config
  class Database

    def self.connect(database_config_hash)
      binding.pry
      ActiveRecord::Base.establish_connection(database_config_hash)
    end

  end
end
