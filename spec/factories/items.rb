FactoryBot.define do
  factory :item do
    name                  {"test123"}
    explanation           {"test"}
    category_id              {"2"}
    item_status_id           {"2"}
    delivery_fee_id          {"3"}
    delivery_area_id         {"4"}
    delivery_date_id         {"5"}
    price                 {"1000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'sample.png')), filename: 'sample.png')
    end
  end
end
