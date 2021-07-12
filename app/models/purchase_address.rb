class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :purchase_record_id, :user_id, :item_id
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :house_number, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー0-9０-９]+\z/, message: "is invalid. Input full-width characters."}
    validates :telephone, format: {with:/\A\d{10}\z|\A\d{11}\z/, message: "is invalid.type 11 digits."}
  end

  def save
    purchased = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone, purchase_record_id: purchased.id)
  end
end