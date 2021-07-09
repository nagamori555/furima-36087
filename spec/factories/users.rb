FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test1234'}
    last_name             {'山田'}
    first_name            {'花子'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'ハナコ'}
    birth_day             {'1987-01-01'}
  end
end