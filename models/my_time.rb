class MyTime

  attr_accessor :time

  def initialize(time = Time.now)
    @time = time
  end

  def free?
    !working?
  end

  def remaining_time
    Time.at(Time.parse(next_time) - Time.parse(hour_to_s)).utc.hour_to_s
  end

  def hour_to_s
    @hour_to_s ||= time.hour_to_s
  end

  private

  def working?
    return false if working_hours.begin.nil? && working_hours.end.nil?
    hour_to_s >= working_hours.begin && hour_to_s <= working_hours.end
  end

  def next_time
    working_hours.end
  end

  def working_hours
    @working_hours ||= OpenStruct.new(WORKING_HOURS[week_day])
  end

  def week_day
    @week_day ||= time.strftime('%u').to_i
  end

end
