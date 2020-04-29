=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

class Listener
  def to_greet(listener, mediator, handler = nil)
      puts(self.class.name + ": How are you #{listener.class.name}?\n" )
      mediator.notify(listener.class.name, handler)
  end

  def on_event(handler)
      handler.message = self.class.name + ": Fine, thanks!"
      puts(handler.message + "\n")
  end
end
