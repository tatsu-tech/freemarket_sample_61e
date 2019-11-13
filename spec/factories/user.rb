FactoryBot.define do

  factory :user do
    id                      {"2"}
    nickname                {"abe"}
    email                   {"kkk@gmail.com"}
    password                {"0000000"}
    password_confirmation   {"0000000"}
    name_family_kanji       {"佐藤"}
    name_first_kanji        {"太郎"}
    name_family_kana        {"サトウ"}
    name_first_kana         {"タロウ"}
    birthday                {"1989-02-10"}
    mobile_phone_number     {"00000000000"}
  end

end