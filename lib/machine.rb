require 'singleton'

class Machine
  include Singleton

  attr_reader :state

  def initialize
    raise 'not implemented. Please initialize the state'
  end

  def receive_event(event)
    raise 'not implemented'
  end

  private

  attr_writer :state
end

class MaxMachine < Machine
  def initialize
    self.state = MaxState.new
  end

  def receive_event(event)
    case event
    when MaxEvent::Events::HUNGER_ATTACKED
      state.set_state(MaxState::States::EATING)
    when MaxEvent::Events::ARRIVED_TO_GYM
      state.set_state(MaxState::States::GYMMING)
    when MaxEvent::Events::FEEL_LIKE_READING
      state.set_state(MaxState::States::READING)
    else
      raise RuntimeError, "Invalid event received: #{event}"
    end
  end
end