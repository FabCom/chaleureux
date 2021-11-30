# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Profile.destroy_all
JoinTableItemCart.destroy_all
JoinTableItemOrder.destroy_all
Order.destroy_all
Cart.destroy_all
Category.destroy_all
Item.destroy_all
User.destroy_all

10.times do 
  User.create!(email: Faker::Internet.email, password: Faker::Lorem.characters(number: 12), is_admin?: false)
end

20.times do
  Item.create(title: Faker::Superhero.name, description: Faker::Lorem.paragraph_by_chars(number: 256), price: rand(0.1..10000.0), image_url: Faker::Avatar.image )
end

10.times do
  Category.create(name: Faker::Emotion.noun)
end

User.all.each do |user|
  Cart.create(user: user)
end

10.times do
  Order.create(user: User.all.sample(1)[0], stripe_id: "stripe_id?", validation_date: rand(1.year.ago..50.weeks.from_now).to_date, price: rand(0.1..10000.0))
end

Order.all.each do |order|
  rand(1..3).times do
    JoinTableItemOrder.create(quantity: 1, order: order, item: Item.all.sample(1)[0])
  end
end

Cart.all.each do |cart|
  rand(1..3).times do
    JoinTableItemCart.create(quantity: 1, cart: cart, item: Item.all.sample(1)[0])
  end
end

User.all.each do |user|
  Profile.create(user: user,  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.phone_number, address: Faker::Address.street_address, address_complement: Faker::Address.secondary_address, zip_code: Faker::Address.zip_code, city: Faker::Address.city)
end