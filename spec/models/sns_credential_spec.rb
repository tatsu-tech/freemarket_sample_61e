require 'rails_helper'

describe SnsCredential, type: :model do
  describe '#user_params' do

    before do
      user = create(:user)
    end

    context "can save" do

      # 登録可能（全項目あり）
      it "is valid with uid, provider and user_id" do

        sns = build(:sns_credential)
        expect(sns).to be_valid
      end
    end

    context "can not save" do

      # 登録不可能（uid空欄）
      it "is invalid without uid" do
        sns = build(:sns_credential, uid: nil)
        sns.valid?
        expect(sns.errors[:uid]).to include("can't be blank")
      end

      # 登録不可能（provider空欄）
      it "is invalid without provider" do
        sns = build(:sns_credential, provider: nil)
        sns.valid?
        expect(sns.errors[:provider]).to include("can't be blank")
      end

      # 登録不可能（user_id空欄）
      it "is invalid without user_id" do
        sns = build(:sns_credential, user_id: nil)
        sns.valid?
        expect(sns.errors[:user_id]).to include("can't be blank")
      end

    end
  end
end

RSpec.describe SnsCredential, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end