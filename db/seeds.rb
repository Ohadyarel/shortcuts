# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Finn101", password: "hocuscrocus", email: "email@email1.com")
User.create(username: "Cuco", password: "kingofplotbunnies", email: "email@email2.com")
User.create(username: "IlikeTurtles", password: "somethingrandom", email: "email@email3.com")

Hack.create(user_id: 1, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
Hack.create(user_id: 2, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
Hack.create(user_id: 3, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)

Tag.create(category: "home")
Tag.create(category: "work")
Tag.create(category: "food")