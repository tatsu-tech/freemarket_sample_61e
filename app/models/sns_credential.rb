class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  validates :provider, :user_id, presence: true
  validates :uid, presence: true, uniqueness: true
end
