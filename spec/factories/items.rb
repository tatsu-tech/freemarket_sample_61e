FactoryBot.define do

  factory :item do
    id              {"3"}
    name            {"testitem"}
    explanation     {"test"}
    price           {"3000"}
    status          {"新品、未使用"}
    delivery_fee    {"送料込み（出品者負担）"}
    delivery_origin {"北海道"}
    delivery_type   {"らくらくメルカリ便"}
    schedule        {"1~2日で発送"}
    user_id         {"2"}
  end
end