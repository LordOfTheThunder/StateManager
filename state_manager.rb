class MaxStateManager
  include EventPublisher
  has_machine MaxMachine.instance
  cattr_reader :machine

  def initialize
    define_observers(@@machine)
  end

  private

  def self.has_machine(machine)
    @@machine = machine
  end
end