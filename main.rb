require_relative "talks"
require_relative "track1"
require_relative "track2"
require_relative "remaining_talks"
require_relative "morning_session"
require_relative "evening_session"

track1 = Track1.new
track2 = Track2.new
remaining = RemainingTalks.new

talks = Talks::EVENTS_LIST_WITH_TIME.sort_by { |k, v| v }

track_1_morning_session = MorningSession.new()

until talks.empty?
  talk = talks.first
  if (track_1_morning_session.is_talk_length_less_than_remaining_time(talk[1]))
    track_1_morning_session.add_talk(talk[0], talk[1])
    talks.delete(talk)
  else
    break
  end
end

track_2_morning_session = MorningSession.new()

until talks.empty?
  talk = talks.first
  if (track_2_morning_session.is_talk_length_less_than_remaining_time(talk[1]))
    track_2_morning_session.add_talk(talk[0], talk[1])
    talks.delete(talk)
  else
    break
  end
end

track_1_evening_session = EveningSession.new()

until talks.empty?
  talk = talks.first
  if (track_1_evening_session.is_talk_length_less_than_remaining_time(talk[1]))
    track_1_evening_session.add_talk(talk[0], talk[1])
    talks.delete(talk)
  else
    break
  end
end
track_2_evening_session = EveningSession.new()

until talks.empty?
  talk = talks.first
  if (track_2_evening_session.is_talk_length_less_than_remaining_time(talk[1]))
    track_2_evening_session.add_talk(talk[0], talk[1])
    talks.delete(talk)
  else
    break
  end
end

until talks.empty?
  talk = talks.first
  remaining.add_talk(talk[0])
  talks.delete(talk)
end

track1.add_session(track_1_morning_session)
track1.add_session("12:00 PM Lunch Break")
track1.add_session(track_1_evening_session)
track2.add_session(track_2_morning_session)
track2.add_session("12:00 PM Lunch Break")
track2.add_session(track_2_evening_session)

puts track1
puts track2
puts remaining
