=begin
author  : Jagepard <jagepard@yandex.ru>
license https://mit-license.org/ MIT
=end

class Mediator
  def initialize
    @listeners = {}
  end

  def add_listener(listener, method_name)
    if @listeners.has_key?(listener.class.name)
      raise "Listener already exists"
    end

    @listeners[listener.class.name] = [listener, method_name]
  end

  def notify(listener_name, handler = nil)
    if @listeners.has_key?(listener_name)
      listener_class_name = @listeners[listener_name][0]
      method_name = @listeners[listener_name][1]

      listener_class_name.send(method_name, handler)
      return
    end
    raise "Listener " + listener_name + " does not exist"
  end
end
