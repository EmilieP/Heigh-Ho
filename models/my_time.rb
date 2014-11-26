class MyTime

  def working?
    hash = WORKING_HOURS[week_day]
    return false if hash[:begin].nil? && hash[:end].nil?
    hour_to_s >= hash[:begin] && hour_to_s <= hash[:end]
  end

  def next_time
    'nope'
  end

  attr_accessor :time

  def initialize(time=Time.now)
    @time = time
  end

  def hour_to_s
    @hour_to_s ||= time.strftime('%H:%M:%S')
  end

  def free?
    true
  end

  def week_day
    @week_day ||= time.strftime('%u').to_i
  end

  def week_end?
    week_day == 6 || week_day == 7
  end

end
