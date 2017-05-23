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
  json.image2 restaurant.image2
  json.image3 restaurant.image3
  json.image4 restaurant.image4
  json.lat restaurant.lat 
  json.long restaurant.long
  json.neighborhood restaurant.neighborhood
  json.guests restaurant.guests
  json.price restaurant.price
  if restaurant.oyster_review.any?
    json.average_oyster_quality restaurant.average_oyster_quality
    json.average_shucking_quality restaurant.average_shucking_quality
    json.average_presentation restaurant.average_presentation
  end
  json.oyster_review restaurant.oyster_review.each do |review| 
    json.id review.id
    json.title review.title
    json.body review.body
    json.oyster_quality review.oyster_quality
    json.shucking_quality review.shucking_quality
    json.presentation review.presentation
    json.user_id review.user_id
    json.restaurant_id review.restaurant_id
    json.oyster_id review.oyster_id
  end 
end 
