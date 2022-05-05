require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
TagGossip.destroy_all
PrivateMessage.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

10.times do
  Tag.create(content: "##{Faker::Lorem.word}")
end

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), email: Faker::Internet.email, age: Faker::Number.between(from: 18, to: 60), city: City.all.sample)
end

20.times do
  Gossip.create(user: User.all.sample, title: Faker::Lorem.word, content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false))
end

Gossip.all.each{|gossip|
  TagGossip.create(gossip: gossip, tag: Tag.all.sample)
}

10.times do
  user_sender = User.all.sample
  user_recipient = User.all.sample
  while user_sender == user_recipient
    user_recipient = User.all.sample
  end
  PrivateMessage.create(content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), sender: user_sender, recipient: user_recipient)
end