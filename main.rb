Dir['lib/*.rb'].each { |file| require_relative file }

state_manager = MaxStateManager.new
puts "Initial state is: #{state_manager.machine.state}"
state_manager.publish_event(MaxEvent::Events::HUNGER_ATTACKED)
puts "Max just got a hunger attack! What would his state be now?"
puts "Max's state is now: #{state_manager.machine.state}"
state_manager.publish_event(MaxEvent::Events::ARRIVED_TO_GYM)
puts "Max just arrived to gym! What is he going to do there? I wonder..."
puts "Seems like now max is: #{state_manager.machine.state}"

puts "But what if max goes to gym 3 times in a row?"
state_manager.publish_event(MaxEvent::Events::ARRIVED_TO_GYM)
state_manager.publish_event(MaxEvent::Events::ARRIVED_TO_GYM)

begin
  state_manager.publish_event('invalid_event')
rescue => e
  puts 'Oh no! Max just received an event he does not know how to handle! That is a big problem...'
  puts e.message
end
