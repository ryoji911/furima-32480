FactoryBot.define do
  factory :order do
    postal_code { "123-4567" }
    area_id { 1 }
    city { "東京都" }
    house_number { "新宿区" }
    phone_number { "09012345678" }
    building_name { "ビル" }
    item_id { 1 }
    user_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
