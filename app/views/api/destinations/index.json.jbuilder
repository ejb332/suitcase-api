json.array! @destinations.each do |destination|
  json.partial! 'destination.json.jbuilder', destination: destination
end