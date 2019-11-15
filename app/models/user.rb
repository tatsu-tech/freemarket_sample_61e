class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one  :user_address
  has_many :cards
  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

    def self.find_oauth(auth)
      uid = auth.uid
      provider = auth.provider
      snscredential = SnsCredential.where(uid: uid, provider: provider).first
      if snscredential.present?
        user = User.where(id: snscredential.user_id).first
      else
        user = User.where(email: auth.info.email).first
        if user.present?
          SnsCredential.create(
            uid: uid,
            provider: provider,
            user_id: user.id
            )
        else
          user = User.create(
            nickname: auth.info.name,
            email:    auth.info.email,
          )

          SnsCredential.create(
            uid: uid,
            provider: provider,
            user_id: user.id
            )
        end
      end
      return user
    end
  
  has_many :items
  has_many :likes
  
  validates :nickname,:email,:password,:password_confirmation,:name_family_kanji,:name_first_kanji,:name_family_kana,:name_first_kana,:mobile_phone_number,:birthday, presence: true
  validates :password,length: {minimum:7}
  validates :mobile_phone_number,uniqueness: true, length: {minimum:11}
end





