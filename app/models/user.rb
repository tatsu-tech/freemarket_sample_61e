class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_one  :user_address
  has_many :cards

  validates :nickname,:email,:password,:password_confirmation,:name_family_kanji,:name_first_kanji,:name_family_kana,:name_first_kana,:mobile_phone_number,:birthday, presence: true
  validates :password,length: {minimum:7}
  validates :mobile_phone_number,uniqueness: true, length: {minimum:11}
end
