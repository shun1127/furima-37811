FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password  { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    first_name{"山田"}
    last_name{"太郎"}
    first_kana{"ヤマダ"}
    last_kana{"タロウ"}
    birthday{Faker::Date.birthday}
  end
end