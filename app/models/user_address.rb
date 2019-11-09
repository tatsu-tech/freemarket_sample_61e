class UserAddress < ApplicationRecord
  belongs_to :user

  validates :send_name_family_kanji,:send_name_first_kanji,:send_name_family_kana,:send_name_first_kana,:zip,:prefecture,:city, presence: true
  validates :zip,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}

end
