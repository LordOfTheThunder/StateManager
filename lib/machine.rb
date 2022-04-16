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
  MAX_NUM_OF_SAME_SUCCESSIVE_EVENTS = 3

  def initialize
    self.state = MaxState.new
    self.event_counter = {}
  end

  def receive_event(event)
    case event
    when MaxEvent::Events::HUNGER_ATTACKED
      on_event_received(MaxEvent::Events::HUNGER_ATTACKED, MaxState::States::EATING)
    when MaxEvent::Events::ARRIVED_TO_GYM
      on_event_received(MaxEvent::Events::ARRIVED_TO_GYM, MaxState::States::GYMMING)
    when MaxEvent::Events::FEEL_LIKE_READING
      on_event_received(MaxEvent::Events::FEEL_LIKE_READING, MaxState::States::READING)
    else
      raise RuntimeError, "Invalid event received: #{event}"
    end
  end

  private

  def on_event_received(event, state)
    self.state.set_state(state)
    set_event_counter(event)

    if event_counter[event] == MAX_NUM_OF_SAME_SUCCESSIVE_EVENTS
      puts "Event #{event} has been fired 3 times in a row"
    end
  end

  def set_event_counter(event)
    self.event_counter[event] ||= 0
    tmp = event_counter[event]
    self.event_counter = {}
    self.event_counter[event] = tmp + 1
  end

  attr_accessor :event_counter
end