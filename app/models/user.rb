class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_one  :user_address
  has_many :cards

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum:7}
  validates :name_family_kanji, presence: true
  validates :name_first_kanji, presence: true
  validates :name_family_kana, presence: true
  validates :name_first_kana, presence: true
  validates :mobile_phone_number, presence: true, uniqueness: true, length: {minimum:11}
  validates :mobile_phone_number, uniqueness: true
  validates :password_confirmation, presence: true
  validates :birthday, presence: true
end
