FactoryBot.define do
  factory :address do
    postal_code                {123-456}
    prefecture_id              {32}
    city                       {'東京都東京区'}
    house_number               {'江戸村明治町３ー３'}
    building_name              {'レジデンシャルテスト'}
    telephone                  {'09012345678'}
    association :purchase_record
  end
end
