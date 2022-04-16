module EventPublisher
  extend self

  def define_observers(observers)
    @observers = observers
  end

  def publish_event(event)
    observers.each { |observer| observer.receive_event(event) }
  end

  private

  attr_reader :observers
end
