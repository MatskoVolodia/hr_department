json.array! @facade.user_groups do |group|
  json.id group.id
  json.group_name group.group_name
end

