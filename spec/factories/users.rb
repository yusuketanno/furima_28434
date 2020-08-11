FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"丹野"}
    first_name {"雄介"}
    family_name_kana {"タンノ"}
    first_name_kana {"ユウスケ"}
    birthday {"1993.10.7"}
  end
end