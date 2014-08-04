require 'pg'
require 'active_record'

module Pace::Config
  class Database

    def self.connect(database_config_hash)
      new(database_config_hash).connect
    end

    def self.create_tables(database_config_hash)
      new(database_config_hash).create_tables
    end

    def initialize(database_config_hash)
      @database_config_hash = database_config_hash
    end

    def connect
      ActiveRecord::Base.establish_connection(@database_config_hash)
    end

    def create_tables
      connect
      ActiveRecord::Base.connection.create_table :users do |t|
        t.string :email
        t.timestamps
      end

      ActiveRecord::Base.connection.create_table :messages do |t|
        t.integer :sender_id
        t.integer :recipient_id
        t.text :body
        t.timestamps
      end
    end

  end
end
