FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    content {Faker::Lorem.sentence}
    category_id {2}
    state_id {2}
    delivery_charge_id {2}
    delivery_area_id {2}
    delivery_day_id {2}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |pic|
      pic.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
