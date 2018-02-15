# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when "development"

User.destroy_all
puts 'All tables are destroyed!'

# Users
# admins and sellers:
User.create!(pseudo: 'SamyCha', email: 'samy@gmail.com', password: '123456', address: '21 quai des salinieres Bordeaux', admin: true, state: 1)
User.create!(pseudo: 'Saraquette', email: 'sarah@gmail.com', password: '123456', address: '64 avenue des Gobelins Paris', admin: true, state: 1)
# sellers only:
User.create!(pseudo: 'Pup', email: 'pup@gmail.com', password: '123456', address: '34 chemin des Bouviers Port Sainte Foy', state: 1)
User.create!(pseudo: 'Mum', email: 'mum@gmail.com', password: '123456', address: '34 chemin des Bouviers Port Sainte Foy', state: 1)
User.create!(pseudo: Faker::Superhero.descriptor, email: 'seller@gmail.com', password: '123456', address: Faker::Address.city, state: 1)
# buyers only:
User.create!(pseudo: Faker::Superhero.descriptor, email: 'buyer@gmail.com', password: '123456', address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: 'buyer1@gmail.com', password: '123456', address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: 'buyer2@gmail.com', password: '123456', address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: 'buyer3@gmail.com', password: '123456', address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: 'buyer4@gmail.com', password: '123456', address: Faker::Address.city, state: 0)
User.create!(pseudo: Faker::Superhero.descriptor, email: 'buyer5@gmail.com', password: '123456', address: Faker::Address.city, state: 0)

# Products

Product.create!(name: 'Chaussures Berlutti', brand: 'Berlutti', size: '44', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.first.id)
Product.create!(name: 'Baskets Nike', brand: 'Nike', size: '42', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.second.id)
Product.create!(name: 'Jean Kaporal', brand: 'Kaporal', size: 'medium', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'pantallon', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(3).id)
Product.create!(name: 'Sac Armani', brand: 'Armani', size: 'petit', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'sac', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(4).id)
Product.create!(name: 'Ceinture Levis', brand: 'Levis', size: 'grande', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'ceinture', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(5).id)
Product.create!(name: 'Chaussures Repetto', brand: 'Repetto', size: '38', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.first.id)
Product.create!(name: 'Bottes Santiag', brand: 'Santiag', size: '42', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.second.id)
Product.create!(name: 'Jean Diesel', brand: 'Diesel', size: 'medium', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'pantallon', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(3).id)
Product.create!(name: 'Sac Hemes', brand: 'Hermes', size: 'petit', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'sac', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(4).id)
Product.create!(name: 'Ceinture Lacoste', brand: 'Lacoste', size: 'grande', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'ceinture', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(5).id)
Product.create!(name: 'Chaussures Minelli', brand: 'Minelli', size: '42', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.first.id)
Product.create!(name: 'Baskets Adidas', brand: 'Adidas', size: '42', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.second.id)
Product.create!(name: 'Pantallon Chino', brand: 'Chino', size: 'medium', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'pantallon', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(3).id)
Product.create!(name: 'Veste Sandro', brand: 'Sandro', size: 'petite', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'veste', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(4).id)
Product.create!(name: 'Ceinture Hermes', brand: 'Hermes', size: 'grande', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'ceinture', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(5).id)
Product.create!(name: 'Chaussures Zara', brand: 'Zara', size: '38', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.first.id)
Product.create!(name: 'Escarpins Chanel', brand: 'Chanel', size: '42', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'chaussures', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.second.id)
Product.create!(name: 'Jean Japan Rag', brand: 'Japan Rag', size: 'medium', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'pantallon', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(3).id)
Product.create!(name: 'Sac Vuitton', brand: 'Vuitton', size: 'petit', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'sac', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(4).id)
Product.create!(name: 'Ceinture Marlboro', brand: 'Marlboro Classique', size: 'grande', color: Faker::Color.color_name, description: Faker::Food.dish, category: 'ceinture', state: 'neuf', active: true, status: 0, address: Faker::Address.city, price: Faker::Number.between(5, 100), user_id: User.find(5).id)

puts '----- Seed done ! -----'

when "production"

    Article.reindex!
end
