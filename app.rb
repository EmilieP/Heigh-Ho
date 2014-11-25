require 'sinatra'
require 'slim'
require 'better_errors'
require 'coffee_script'
require './free_time'
require './video'

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
      free_time = FreeTime.new
      if free_time.free?
        video = Video.sample
        data = 'data: '
        data << "{ \"current_time\": \"#{free_time.hour}\", "
        data << "\"video\": \"#{VIDEOS.sample}\", "
        data << "\"next_time\": \"#{free_time.next_time}\""
        data << " }"
        data << "\n\n"
      else
        data = 'data: '
        data << "{ \"current_time\": \"#{free_time.hour}\", "
        data << "\"video\": \"\", "
        data << "\"next_time\": \"#{free_time.next_time}\""
        data << " }"
        data << "\n\n"
      end
      out << data
    end
  end
end
