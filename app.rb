configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :server, :thin
set :video_id, nil

connections = []

get '/' do
  slim :home
end

get '/surprise' do
  slim :rick_roll, locals: { video_id: Video.rick_roll.id }
end

get '/stream', provides: 'text/event-stream' do
  stream :keep_open do |out|
    EventMachine::PeriodicTimer.new(3) do
      time = MyTime.new
      if time.free?
        settings.video_id ||= Video.sample.id
      else
        settings.video_id = nil
      end

      out << EventData.build({ current_time: time.hour_to_s, video: settings.video_id, next_time: 'nope' })
    end
  end
end
