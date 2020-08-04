class Track1
  def initialize
    @morning_talks = []
    @evening_talks = []
    @morning_slot_time = 180
    @evening_slot_time = 240
    @begin_time = 9
  end

  def remaining_time_morning_slot
    @morning_slot_time
  end

  def remaining_time_evening_slot
    @evening_slot_time
  end

  def add_morning_talk(talk)
    @morning_talks << talk
  end

  def add_evening_talk(talk)
    @evening_talks << talk
  end

  def fetch_talks(a)
    a == "morning" ? @morning_talks : @evening_talks
  end

  def update_morning_time(talk_length_in_mins)
    @morning_slot_time -= talk_length_in_mins
  end

  def update_evening_time(talk_length_in_mins)
    @evening_slot_time -= talk_length_in_mins
  end

  def is_lighnting_talk?(talk)
    talk[1] == 5
  end
end
