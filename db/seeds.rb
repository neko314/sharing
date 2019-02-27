days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

days.each do |day|
  Day.create(name: day)
end