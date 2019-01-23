json.id contact.id
json.first_name contact.first_name
json.middle_name contact.middle_name
json.last_name contact.last_name
json.email contact.email
json.phone contact.phone
json.bio contact.bio

json.formatted do 
  json.full_name contact.full_name
  json.phone contact.japanese_country_code
  json.created_at contact.friendly_created_at
  json.updated_at contact.friendly_updated_at
end
