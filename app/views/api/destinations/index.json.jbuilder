json.array! @destinations.each do |destination|
  json.location destination.location
  json.start_date destination.start_date
  json.end_date destination.end_date
end