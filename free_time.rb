class FreeTime

  FREETIME = {
    1 => '18:30:00',
    2 => '12:30:00',
    3 => '18:30:00',
    4 => '18:30:00',
    5 => '17:30:00',
    6 => '00:00:00',
    7 => '00:00:00',
  }.freeze

  attr_accessor :time

  def initialize(time=Time.now)
    @time = time
  end

  def free_time?
    week_end? || free_hour?
  end

  def hour
    @hour ||= time.strftime('%H:%M:%S')
  end

  def next_free_time
    FREETIME[week_day.to_i]
  end

  private

  def week_day
    @week_day ||= time.strftime('%u')
  end

  def free_hour?
    hour >= FREETIME[week_day.to_i]
  end

  def week_end?
    week_day == '6' || week_day == '7'
  end

end
