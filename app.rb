require 'sinatra'
require 'slim'
require 'better_errors'
require 'coffee_script'
require './free_time'

VIDEOS = ["5efO0e_ft3w", "wZZ7oFKsKzY"]

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :server, :thin
connections = []

get '/' do
  slim :home
end

get '/stream', provides: 'text/event-stream' do
  stream :keep_open do |out|
    EventMachine::PeriodicTimer.new(3) do
      time = FreeTime.new
      if time.free_time?
        data = 'data: '
        data << "{ \"current_time\": \"#{time.hour}\", "
        data << "\"video\": \"#{VIDEOS.sample}\", "
        data << "\"next_time\": \"#{time.next_free_time}\""
        data << " }"
        data << "\n\n"
        out << data
      end
    end
  end
end
