class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: {other_than: 0 , message: "can't be blank"}
  validates :status_id, numericality: {other_than: 0 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: {other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 0 , message: "can't be blank"}
end