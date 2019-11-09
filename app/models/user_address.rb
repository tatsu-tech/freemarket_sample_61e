class UserAddress < ApplicationRecord
  belongs_to :user

  validates :send_name_family_kanji, presence: true
  validates :send_name_first_kanji, presence: true
  validates :send_name_family_kana, presence: true
  validates :send_name_first_kana, presence: true
  validates :zip, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :zip,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}

end
