class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. Not include hyphen(-) (maximum is 11 characters)"}
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
