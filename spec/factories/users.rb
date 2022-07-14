FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name{Faker::Name.first_name}
    last_name{Faker::Name.last_name}
    first_kana{Faker::Name.first_name}
    last_kana{Faker::Name.last_name}
    birthday{Faker::Date.birthday}
  end
end