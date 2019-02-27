# Basic chat app using Rails ActionCable functionality

We will be building a basic chat app to learn about the [ActionCable functionality](https://guides.rubyonrails.org/action_cable_overview.html) which uses [websockets](https://en.wikipedia.org/wiki/WebSocket) protocol.

Our App will have following features:

- User Authentication
- Push notifications in chat windows
- List of chats and list of available users

`Disclaimer: This guide assumes a basic familiarity with rails development, like assoications and devise gem installation.`

## Scaffold Basic Rails App

First scaffold basic rails app

`rails new chat_app --database=postgresql --skip-test --skip-bundle`

Set up [Cucumber](https://github.com/cucumber/cucumber-rails) for testing.

## Set up Devise

Set up [devise](https://github.com/plataformatec/devise) which will be used for user authentication.

## Set up models and Associations

Now comes the fun part!
We will need two models: **Chat** and **Message** .

**Chat** model will be empty and **Message** model will have a 'text' column with string datatype.

Use

`rails g model Chat` and `rails g model Message text:string`

to generate each.

Now is the time to add associations!

1. **Chats** and **Messages** have `has_many` & `belongs_to` associations.
2. **Users** and **Messages** have `has_many` & `belongs-to` associations.
3. **Chats** and **Users** have `has_many_and_belongs_to` association(!).

After setting up the associations and adding respective foreign-ids via migrations, set up the seed file.

```Ruby
Message.destroy_all
Chat.destroy_all
User.destroy_all

user1 = User.create(email: 'user1@mail.com', password:'password')
user2 = User.create(email: 'user2@mail.com', password:'password')
user3 = User.create(email: 'user3@mail.com', password:'password')

chat_1 = Chat.create()
chat_1.users << user1
chat_1.users << user2

chat_2 = Chat.create()
chat_2.users << user1
chat_2.users << user3
```

Set up chat and messages controllers with basic actions

Set up the routes

## Set up ActionCable

## Styling
