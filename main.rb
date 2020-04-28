=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

require "./mediator"
require "./colleague1"
require "./colleague2"
require "./colleague3"

# handler   = Handler.new
mediator  = Mediator.new
listener1 = Colleague1.new
listener2 = Colleague2.new
listener3 = Colleague3.new

begin
  mediator.add_listener(listener1, "onEvent")
  mediator.add_listener(listener2, "onEvent")
  mediator.add_listener(listener3, "onEvent")
  listener1.to_greet(listener2, mediator, handler)
  # listener2.to_greet(Colleague3::class, mediator, handler)
  # listener3.to_greet(Colleague1::class, mediator, handler)
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end