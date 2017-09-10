# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Book.create({
    title: Faker::Book.title,
    author: Faker::Book.author,
    isbn: Faker::Number.number(13),
    genre: Faker::Book.genre
  })
end

10.times do
  Destination.create({
    destination: Faker::Address.city,
    purpose: Faker::Hipster.word,
    transportation: Faker::Vehicle.manufacture,
    season: 'Autumn',
    climate: 'Beach'
    })
end
