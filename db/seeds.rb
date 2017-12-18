# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
puts "All tables are destroyed!"

# Users
# admins and sellers:
User.create!(pseudo: "SamyCha", email: "samy@gmail.com", password: "123456", address: "21 quai des salinieres Bordeaux", admin: true, state: 1)
User.create!(pseudo: "Saraquette", email: "sarah@gmail.com", password: "123456", address: "64 avenue des Gobelins Paris", admin: true, state: 1)
# sellers only:
User.create!(pseudo: "Pup", email: "pup@gmail.com", password: "123456", address: "34 chemin des Bouviers Port Sainte Foy", state: 1)
User.create!(pseudo: "Mum", email: "mum@gmail.com", password: "123456", address: "34 chemin des Bouviers Port Sainte Foy", state: 1)
User.create!(pseudo: Faker::Superhero.descriptor, email: "seller@gmail.com", password: "123456", address: Faker::Address.city, state: 1)
# buyers only:
User.create!(pseudo: Faker::Superhero.descriptor, email: "buyer@gmail.com", password: "123456", address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: "buyer1@gmail.com", password: "123456", address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: "buyer2@gmail.com", password: "123456", address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: "buyer3@gmail.com", password: "123456", address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: "buyer4@gmail.com", password: "123456", address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: "buyer5@gmail.com", password: "123456", address: Faker::Address.city, state: 0)

# Products
10.times do  |index|
  Product.create!(name: Faker::Name.first_name  , brand: Faker::Company.profession, size: Faker::Number.between(1, 10), color: Faker::Color.color_name, description: Faker::Food.dish, category: Faker::Book.genre, state: "neuf", active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(1, 100), user_id: User.first.id)
  Product.create!(name: Faker::Name.first_name  , brand: Faker::Company.profession, size: Faker::Number.between(1, 10), color: Faker::Color.color_name, description: Faker::Food.dish, category: Faker::Book.genre, state: "neuf", active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(1, 100), user_id: User.second.id)
  Product.create!(name: Faker::Name.first_name  , brand: Faker::Company.profession, size: Faker::Number.between(1, 10), color: Faker::Color.color_name, description: Faker::Food.dish, category: Faker::Book.genre, state: "neuf", active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(1, 100), user_id: User.find(3).id)
  Product.create!(name: Faker::Name.first_name  , brand: Faker::Company.profession, size: Faker::Number.between(1, 10), color: Faker::Color.color_name, description: Faker::Food.dish, category: Faker::Book.genre, state: "neuf", active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(1, 100), user_id: User.find(4).id)
  Product.create!(name: Faker::Name.first_name  , brand: Faker::Company.profession, size: Faker::Number.between(1, 10), color: Faker::Color.color_name, description: Faker::Food.dish, category: Faker::Book.genre, state: "neuf", active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(1, 100), user_id: User.find(5).id)
end


puts "----- Seed done ! -----"
