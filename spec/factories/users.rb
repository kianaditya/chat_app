FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "user-#{n}@random.com" }
        password { "password" }
        password_confirmation { "password" }
    end
  end