class CounterController < ApplicationController
 before_action :counter
  def show
    
  end

  def increment
    
    counter.increment
    # stream_counter
    Turbo::StreamsChannel.broadcast_update_to('counter_stream', target: 'counter', html: counter.value)
   
  end

  def decrement
    
    counter.decrement
    # stream_counter
    Turbo::StreamsChannel.broadcast_update_to('counter_stream', target: 'counter', html: counter.value)
  end

  private

  def stream_counter
    respond_to do |format|
      format.turbo_stream do
       render turbo_stream: turbo_stream.update('counter', html: counter.value)

      end
    end
  end
  def counter
    @counter ||= Kredis.counter 'mycounter'
  end
end
