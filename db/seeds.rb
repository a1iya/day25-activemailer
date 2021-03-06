# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  User.create(
  email: Faker::Internet.email,
  description: Faker::TvShows::TwinPeaks.quote,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name
  )
end

10.times do
  Event.create(
    start_date: Faker::Date.forward(10),
    duration: 15,
    title: Faker::Lorem.characters(60),
    description: Faker::Lorem.characters(300),
    price: Faker::Number.between(1, 1000),
    location: Faker::Games::Zelda.location,
  )
end

30.times do
  Attendance.create(
    stripe_customer_id: rand(1..100),
    user: User.all.sample,
    event: Event.all.sample
  )
end
