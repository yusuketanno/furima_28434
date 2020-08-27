FactoryBot.define do
  factory :address do
    postal_code    {"123-4567"}
    prefecture_id  {8}
    city           {"東京"}
    address        {"1-1"}
    tell           {"09089899009"}
    # user_id        {1}
    # item_id        {2}

    # association    :user
    # association    :item
    
  end
end
