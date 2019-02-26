# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Chat.destroy_all
User.destroy_all

user1 = User.create(email: 'user1@mail.com', password:'password')
user2 = User.create(email: 'user2@mail.com', password:'password')

chat = Chat.create()
chat.users << user1
chat.users << user2

5.times do
  Message.create(text:'Hej', user_id: user1.id, chat_id: chat.id)
end
