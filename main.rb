require_relative "talks"
require_relative "track1"
require_relative "track2"
require_relative "remaining_talks"

track1 = Track1.new
track2 = Track2.new
remaining_talks = RemainingTalks.new

$All_five_min_talks = Talks::EVENTS_LIST_WITH_TIME.select { |key, hash| hash == 5 }
# puts $All_five_min_talks

list_of_events_with_duration = Talks::EVENTS_LIST_WITH_TIME.sort_by { |k, v| v }

for i in list_of_events_with_duration
  # puts $All_five_min_talks.length * 5
  if ($All_five_min_talks.length * 5 < track1.remaining_time_morning_slot)
  end
  if track1.remaining_time_morning_slot >= i[1]
    if track1.is_lighnting_talk?(i[1])
      for t in $All_five_min_talks
        track1.add_morning_talk(t[0], t[1])
        track1.update_morning_time(t[1])
      end
    elsif track1.add_morning_talk(i[0], i[1])
      track1.update_morning_time(i[1])
    end
    # track1.add_morning_talk(i[0], i[1])
    # track1.update_morning_time(i[1])
  elsif track2.remaining_time_morning_slot >= i[1]
    track2.add_morning_talk(i[0], i[1])
    track2.update_morning_time(i[1])
  elsif track1.remaining_time_evening_slot >= i[1]
    track1.add_evening_talk(i[0], i[1])
    track1.update_evening_time(i[1])
  elsif track2.remaining_time_evening_slot >= i[1]
    track2.add_evening_talk(i[0], i[1])
    track2.update_evening_time(i[1])
  else
    remaining_talks.add_talk(i[0])
  end
end

puts "Track 1"
puts track1.fetch_talks("morning")
puts "12:00 PM Lunch Time"
puts track1.fetch_talks("evening")
puts
puts "Track 2"
puts track2.fetch_talks("morning")
puts "12:00 PM Lunch Time"
puts track2.fetch_talks("evening")
puts
puts "Remaining talks"
puts "#{remaining_talks.fetch_talks.empty? ? "None" : remaining_talks.fetch_talks}"
