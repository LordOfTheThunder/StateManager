class Event
  attr_reader :metadata
end

class MaxEvent < Event
  module Events
    HUNGER_ATTACKED   = 'hunger_attack'.freeze
    ARRIVED_TO_GYM    = 'arrive_to_gym'.freeze
    FEEL_LIKE_READING = 'felt_like_reading'.freeze
  end
end
