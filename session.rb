class Session
  attr_accessor :talks, :session_length_in_mins, :start_time_in_minutes

  def initialize(session_length_in_mins, start_time_in_minutes)
    @talks = []
    @session_length_in_mins = session_length_in_mins
    @start_time_in_minutes = start_time_in_minutes
  end

  def to_s
    result = ""
    talks.each { |t| result += t + "\n" }
    result
  end

  def add_talk(talk, time)
    @talks << ("#{add_timestamp(time)} #{talk}")
    @session_length_in_mins -= time
  end

  def is_talk_length_less_than_remaining_time(talk_length)
    @session_length_in_mins >= talk_length
  end

  def add_timestamp(time)
    hours = @start_time_in_minutes / 60
    minutes = @start_time_in_minutes % 60

    if hours.to_s.length < 2
      hours = "0#{hours}"
    end

    if minutes.to_s.length < 2
      minutes = "0#{minutes}"
    end

    @start_time_in_minutes += time

    am_or_pm = hours.to_i >= 12 ? "PM" : "AM"
    "#{hours}:#{minutes} #{am_or_pm}"
  end

  def to_s
    result = ""
    @talks.each do |t|
      result += "#{t}\n"
    end
    result.chomp
  end
end
