json.array! @restaurants.each do |restaurant| 
  json.id restaurant.id
  json.yelp_id restaurant.yelp_id
  json.name restaurant.name
  json.address restaurant.address
  json.hours restaurant.hours
  json.menu restaurant.menu
  json.specials restaurant.specials
  json.website restaurant.website
  json.about restaurant.about
  json.image restaurant.image
end 