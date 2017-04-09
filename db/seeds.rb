# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
    first_name: first_name,
    last_name: last_name,
    user_name: Faker::Name.first_name,
    email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
    dob: Faker::Date.between, 
    password: "password",
    password_confirmation: "password"
    )
end 

puts "Done!" 
