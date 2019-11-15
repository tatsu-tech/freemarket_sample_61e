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

  validates :nickname,:email,:password,:password_confirmation,:name_family_kanji,:name_first_kanji,:name_family_kana,:name_first_kana,:mobile_phone_number,:birthday, presence: true
  validates :password,length: {minimum:7}
  validates :mobile_phone_number,uniqueness: true, length: {minimum:11}
end

# def self.without_sns_data(auth)                     #snsデータがない場合
#   user = User.where(email: auth.info.email).first   

#     if user.present?
#       sns = SnsCredential.create(
#         uid: auth.uid,
#         provider: auth.provider,
#         user_id: user.id
#       )
#     else
#       user = User.new(
#         nickname: auth.info.name,
#         email: auth.info.email,
#         password: Devise.friendly_token[0,20]
#       )
#       sns = SnsCredential.new(
#         uid: auth.uid,
#         provider: auth.provider
#       )
#     end
#       return { user: user ,sns: sns}
#     end

# def self.with_sns_data(auth, snscredential)
#   user = User.where(id: snscredential.user_id).first
#   unless user.present?
#     user = User.new(
#       nickname: auth.info.name,
#       email: auth.info.email,
#     )
#   end
#   return {user: user}
# end

# def self.find_oauth(auth)
#   uid = auth.uid
#   provider = auth.provider
#   snscredential = SnsCredential.where(uid: uid, provider: provider).first
#   if snscredential.present?
#     user = with_sns_data(auth, snscredential)[:user]
#     sns = snscredential
#   else
#     user = without_sns_data(auth)[:user]
#     sns = without_sns_data(auth)[:sns]
#   end
#   return { user: user ,sns: sns}
# end






  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.name = auth.info.name   # assuming the user model has a name
  #     user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails, 
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end