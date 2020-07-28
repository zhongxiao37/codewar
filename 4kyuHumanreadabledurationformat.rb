def format_duration(seconds)
  return 'now' if seconds == 0

  sec = seconds % 60
  min = seconds / 60
  hour = min / 60
  min = min % 60
  day = hour / 24
  hour = hour % 24
  year = day / 365
  day = day % 365

  duration = []
  duration << (year == 1 ? '1 year' : "#{year} years") if year > 0
  duration << (day == 1 ? '1 day' : "#{day} days") if day > 0
  duration << (hour == 1 ? '1 hour' : "#{hour} hours") if hour > 0
  duration << (min == 1 ? '1 minute' : "#{min} minutes") if min > 0
  duration << (sec == 1 ? '1 second' : "#{sec} seconds") if sec > 0

  last = duration.pop
  return [duration.join(', '), last].join(' and ') if duration.size > 0
  last
end