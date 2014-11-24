require 'sinatra'
require 'slim'
require 'better_errors'
require 'coffee_script'

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
      now = Time.now
      if now >= Time.new(now.year, now.month, now.day, 21, 57) && now <= Time.new(Time.now.year, Time.now.month, Time.now.day, 21, 58)
        out << "data: #{Time.now}\n\n"
      end
    end
  end
end
