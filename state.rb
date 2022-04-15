class State
  attr_reader :state

  def initialize
    raise 'not implemented'
  end

  def set_state(state)
    raise 'not implemented'
  end
end

class MaxState < State
  module States
    THINKING_WHAT_TO_DO = 'thinking_what_to_do'.freeze
    SLEEPING            = 'none'.freeze
    READING             = 'reading'.freeze
    GYMMING             = 'gymming'.freeze
    EATING              = 'eating'.freeze
    STUDYING            = 'studying'.freeze

    ALL ||= constants.map &method(:const_get)
  end

  def initialize
    self.state = States::THINKING_WHAT_TO_DO
  end

  def set_state(state)
    guard_valid_state!(state)

    self.state = state
  end

  private

  def guard_valid_state!(state)
    return unless States::ALL.include?(state)

    raise RuntimeError, 'invalid state'
  end
end