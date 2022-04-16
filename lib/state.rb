# Simple state interface with a public read method and a private write method

class State
  attr_reader :state

  def initialize
    raise 'not implemented'
  end

  def set_state(state)
    raise 'not implemented'
  end

  def to_s
    raise 'not implemented'
  end

  private

  attr_writer :state
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

  def to_s
    self.state
  end

  private

  def guard_valid_state!(state)
    return if States::ALL.include?(state)

    raise RuntimeError, 'invalid state'
  end
end