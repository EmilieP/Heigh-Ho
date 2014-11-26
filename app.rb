require 'sinatra'
require 'slim'
require 'better_errors'
require 'coffee_script'

Dir["./models/**/*.rb"].each { |model| require model }

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
      time = MyTime.new
      if time.free?
        @video ||= Video.sample.id
      else
        @video = nil
      end
      out << EventData.build({ current_time: time.hour_to_s, video: @video, next_time: 'nope' })
    end
  end
end
