module Pace
  module Config
    autoload :Database, File.expand_path(File.dirname(__FILE__)) + '/config/database.rb'
  end
end
