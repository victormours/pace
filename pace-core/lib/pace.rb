require_relative 'config'
require_relative 'console'

module Pace

  def self.autoload_relative(class_name, file)
    absolute_filepath = File.expand_path(File.dirname(__FILE__))
    autoload class_name, absolute_filepath + file
  end

  autoload_relative :User, '/models/user.rb'
  autoload_relative :Message, '/models/message.rb'

  autoload_relative :SendMessage, '/actions/send_message.rb'
  autoload_relative :Signup, '/actions/signup.rb'

  autoload_relative :ReceivedMessages, '/queries/received_messages.rb'
  autoload_relative :SentMessages, '/queries/sent_messages.rb'
  autoload_relative :SingleMessage, '/queries/single_message.rb'
end
