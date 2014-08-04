require_relative 'config'
require_relative 'console'

module Pace
  autoload :User, File.expand_path(File.dirname(__FILE__)) + '/models/user.rb'
  autoload :Message, File.expand_path(File.dirname(__FILE__)) + '/models/message.rb'
end
