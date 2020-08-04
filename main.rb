require_relative "talks"
require_relative "track1"
require_relative "track2"
require_relative "remaining_talks"

track1 = Track1.new
track2 = Track2.new
remaining_talks = RemainingTalks.new

$All_five_min_talks = Talks::EVENTS_LIST_WITH_TIME.select { |key, hash| hash == 5 }
puts $All_five_min_talks

for i in Talks::EVENTS_LIST_WITH_TIME
  # if $all_five_min_talks.include?(i[0])
  #   puts i[0]
  # end
  # puts i[1].class
  # puts i

  # if track1.is_lighnting_talk?(i[1])
  # end

  if track1.remaining_time_morning_slot >= i[1]
    track1.add_morning_talk(i[0], i[1])
    track1.update_morning_time(i[1])
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
puts
puts track1.fetch_talks("morning")
puts "12:00 PM Lunch Time"
puts track1.fetch_talks("evening")
puts
puts "Track 2"
puts
puts track2.fetch_talks("morning")
puts "12:00 PM Lunch Time"
puts track2.fetch_talks("evening")
puts
puts "Remaining talks"
puts "#{remaining_talks.fetch_talks.empty? ? "None" : remaining_talks.fetch_talks}"

# if track1.is_lighnting_talk?(i[1])

#   track1.add_morning_talk(x[0], x[1])
#   track1.update_morning_time(x[1])
# end
# else
# track1.add_morning_talk(i[0], i[1])
# track1.update_morning_time(i[1])
# end
