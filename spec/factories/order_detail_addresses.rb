FactoryBot.define do
  factory :order_detail_address do
      user_id{2}
      item_id{2}
      post_code {Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4)}
      delivery_area_id {2}
      city  { "東京都港区" }
      address_one {"青山1-1-1"}
      address_two{"ビル"}
      phone_number{"09011111111"}
      token {"tok_abcdefghijk00000000000000000"}
  end
end
