FactoryBot.define do

  factory :user_address do
    send_name_family_kanji    {"佐藤"}
    send_name_first_kanji     {"太郎"}
    send_name_family_kana     {"サトウ"}
    send_name_first_kana      {"タロウ"}
    zip                       {"000-0000"}
    prefecture                {"東京都"}
    city                      {"渋谷区"}
    town                      {"神南1-1-1"}
    phone_number              {"0000000000"}
  end

end
