class MyTime

  def next_time
    'nope'
  end

  def remaining_time
    '3:00:00'
  end

  attr_accessor :time

  def initialize(time=Time.now)
    @time = time
  end

  def hour_to_s
    @hour_to_s ||= time.strftime('%H:%M:%S')
  end

  def working?
    return false if working_hours.begin.nil? && working_hours.end.nil?
    hour_to_s >= working_hours.begin && hour_to_s <= working_hours.end
  end

  def free?
    !working?
  end

  def working_hours
    @working_hours ||= OpenStruct.new(WORKING_HOURS[week_day])
  end

  def week_day
    @week_day ||= time.strftime('%u').to_i
  end

end
