state_manager = MaxStateManager.new
puts state_manager.machine.state
state_manager.publish_event(MaxEvent::Events::HUNGER_ATTACKED)
puts state_manager.machine.state
state_manager.publish_event(MaxEvent::Events::GYMMING)
puts state_manager.machine.state
begin
  state_manager.publish_event('invalid_event')
rescue => e
  puts 'Error!'
  puts e.message
end