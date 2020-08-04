class Track1
  def initialize
    @talks = []
    @morning_slot_time = 180
    @evening_slot_time = 240
  end

  def add_talk(talk)
    @talks << talk
  end

  def morning_slot_remaining_time(talk_length_in_mins)
    @morning_slot_time -= talk_length_in_mins
  end

  def evening_slot_remaining_time(talk_length_in_mins)
    @evening_slot_time -= talk_length_in_mins
  end
end
