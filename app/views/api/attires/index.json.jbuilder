json.array! @attire.each do |attire|
  json.item_name attire.item_name
  json.color attire.color
  json.category attire.category
end
