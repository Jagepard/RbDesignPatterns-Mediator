=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

require "./mediator"
require "./handler"
require "./colleague1"
require "./colleague2"
require "./colleague3"

handler   = Handler.new
mediator  = Mediator.new
listener1 = Colleague1.new
listener2 = Colleague2.new
listener3 = Colleague3.new

begin
  mediator.add_listener(listener1, "on_event")
  mediator.add_listener(listener2, "on_event")
  mediator.add_listener(listener3, "on_event")
  listener1.to_greet(listener2, mediator, handler)
  listener2.to_greet(listener3, mediator, handler)
  listener3.to_greet(listener1, mediator, handler)
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
