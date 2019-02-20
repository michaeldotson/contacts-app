json.id contact.id
json.first_name contact.first_name
json.middle_name contact.middle_name
json.last_name contact.last_name
json.email contact.email
json.phone contact.phone
json.full_name contact.full_name
json.bio contact.bio
json.current_user current_user
json.group_names contact.group_names

json.formatted do
  json.updated_at contact.friendly_updated_at
  json.phone contact.japan_phone
end