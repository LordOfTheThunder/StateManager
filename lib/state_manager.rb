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
