json.array! @facade.user_groups do |group|
  json.id group.id
  json.text group.group_name
end