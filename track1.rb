class Track1
  def initialize
    @morning_talks = []
    @evening_talks = []
    @morning_slot_time = 180
    @evening_slot_time = 240
    @begin_time_morning = 540
    @begin_time_evening = 780
  end

  def remaining_time_morning_slot
    @morning_slot_time
  end

  def remaining_time_evening_slot
    @evening_slot_time
  end

  def add_morning_talk(talk, time)
    @morning_talks << ("#{add_timestamp_morning(time)} #{talk}")
  end

  def add_evening_talk(talk, time)
    @evening_talks << ("#{add_timestamp_evening(time)} #{talk}")
  end

  def add_timestamp_morning(time)
    hours = @begin_time_morning / 60
    minutes = @begin_time_morning % 60

    if hours.to_s.length < 2
      hours = "0#{hours}"
    end

    if minutes.to_s.length < 2
      minutes = "0#{minutes}"
    end
    @begin_time_morning += time
    "#{hours}:#{minutes} AM"
  end

  def add_timestamp_evening(time)
    hours = @begin_time_evening / 60
    minutes = @begin_time_evening % 60

    if hours.to_s.length < 2
      hours = "0#{hours}"
    end

    if minutes.to_s.length < 2
      minutes = "0#{minutes}"
    end

    @begin_time_evening += time
    "#{hours}:#{minutes} PM"
  end

  def fetch_talks(time_of_day)
    time_of_day == "morning" ? @morning_talks : @evening_talks
  end

  def update_morning_time(talk_length_in_mins)
    @morning_slot_time -= talk_length_in_mins
  end

  def update_evening_time(talk_length_in_mins)
    @evening_slot_time -= talk_length_in_mins
  end
end
