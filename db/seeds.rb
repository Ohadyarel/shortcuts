# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Hack.delete_all
Favorite.delete_all
HackTag.delete_all
Tag.delete_all

User.create(username: "BoredPanda", password: "panda1234", email: "email@email1.com")
User.create(username: "ohadyarel", password: "123456", email: "email@email2.com", admin: true)
# User.create(username: "IlikeTurtles", password: "somethingrandom", email: "email@email3.com")

# Hack.create(user_id: 1, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
# Hack.create(user_id: 2, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
# Hack.create(user_id: 3, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)

# Tag.create(category: "home")
# Tag.create(category: "work")
# Tag.create(category: "food")

lh = Nokogiri::HTML(open('http://www.boredpanda.com/life-hacks/'))
files = lh.css('//p[@class="attachment-link-container"]//img')
files.each do |lh|
	src = lh.attr('src')
	Hack.create(user_id: 1, lhimgurl: src)
end