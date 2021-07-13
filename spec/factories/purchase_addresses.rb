FactoryBot.define do
  factory :purchase_address do
    postal_code                {'123-4568'}
    prefecture_id              {32}
    city                       {'東京都東京区'}
    house_number               {'江戸村明治町３ー３'}
    building_name              {'レジデンシャルテスト'}
    telephone                  {'09012345678'}
    token                      {"tok_abcdefghijk00000000000000000"}
    user_id                    {4}
    item_id                    {7}
  end
end
