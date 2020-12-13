class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_id
      validates :area_id
      validates :day_id
    end
    validates :price,numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end

