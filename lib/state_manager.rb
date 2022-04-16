# A general class used to manage machine state
# I used the observer design pattern to use it as a bridge between event publisher and a machine receiving the event

class MaxStateManager
  include EventPublisher
  @@machine = MaxMachine.instance

  def initialize
    define_observers([@@machine])
  end

  def machine
    @@machine
  end
end
