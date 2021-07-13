class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :status

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  
  with_options presence: true do
    validates :image
    with_options numericality: {other_than: 0 , message: "can't be blank"} do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
    validates :item_name, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :price, numericality: {only_integer: true, greater_than: 299, less_than: 10000000, message: "is invalid."}
  end
end