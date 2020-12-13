FactoryBot.define do
  factory :item do
    item_name { '服' }
    explanation { "最新の服" }
    category_id { '1' }
    status_id { '1' }
    shipping_id { '1' }
    area_id { '1' }
    day_id { '1' }
    price { 2000 }
  end
end
