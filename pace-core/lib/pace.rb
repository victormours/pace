require_relative 'config'
require_relative 'console'

module Pace
  autoload :User, File.expand_path(File.dirname(__FILE__)) + '/models/user.rb'
  autoload :Message, File.expand_path(File.dirname(__FILE__)) + '/models/message.rb'

  autoload :SendMessage, File.expand_path(File.dirname(__FILE__)) + '/actions/send_message.rb'
  autoload :Signup, File.expand_path(File.dirname(__FILE__)) + '/actions/signup.rb'

  autoload :ReceivedMessages, File.expand_path(File.dirname(__FILE__)) + '/actions/received_messages.rb'
  autoload :SentMessages, File.expand_path(File.dirname(__FILE__)) + '/actions/sent_messages.rb'
  autoload :SingleMessage, File.expand_path(File.dirname(__FILE__)) + '/actions/single_message.rb'
end
