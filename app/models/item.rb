class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :category_id, numericality: {other_than: 0 , message: "can't be blank"}
    validates :status_id, numericality: {other_than: 0 , message: "can't be blank"}
    validates :delivery_fee_id, numericality: {other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: {other_than: 0 , message: "can't be blank"}
    validates :price, numericality: {only_integer: true, in: 300..9999999, message: "is invalid."}
  end
end