FactoryBot.define do
  factory :item do
    item_name                {'テスト'}
    description              {'テスト用のbotです。'}
    category_id              {3}
    status_id                {2}
    delivery_fee_id          {2}
    prefecture_id            {36}
    days_to_ship_id          {1}
    price                    {500}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
