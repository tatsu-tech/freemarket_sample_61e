require 'rails_helper'
require 'user'

describe User do
  describe '#validates_signup1' do

    it "空欄なしだと保存できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空だと保存できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空だと保存できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが空だと保存できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空だと保存できない" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "name_family_kanjiが空だと保存できない" do
      user = build(:user, name_family_kanji: nil)
      user.valid?
      expect(user.errors[:name_family_kanji]).to include("can't be blank")
    end

    it "is invalid without a name_first_kanji" do
      user = build(:user, name_first_kanji: nil)
      user.valid?
      expect(user.errors[:name_first_kanji]).to include("can't be blank")
    end

    it "name_family_kanaが空だと保存できない" do
      user = build(:user, name_family_kana: nil)
      user.valid?
      expect(user.errors[:name_family_kana]).to include("can't be blank")
    end

    it "name_first_kanaが空だと保存できない" do
      user = build(:user, name_first_kana: nil)
      user.valid?
      expect(user.errors[:name_first_kana]).to include("can't be blank")
    end

    it "passwordが7文字以上であれば登録できる" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが６文字以下だと登録できない" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

  end

  describe '#validates_signup2' do

    it "mobile_phone_numberが空だと保存できない" do
      user = build(:user, mobile_phone_number: nil)
      user.valid?
      expect(user.errors[:mobile_phone_number]).to include("can't be blank")
    end

    it "重複した携帯電話番号があると登録できない" do
      user = create(:user)
      another_user = build(:user, mobile_phone_number: user.mobile_phone_number)
      another_user.valid?
      expect(another_user.errors[:mobile_phone_number]).to include("has already been taken")
    end

    it "携帯電話番号が11文字以上であれば登録できる" do
      user = build(:user, mobile_phone_number: "00000000000", mobile_phone_number: "00000000000")
      user.valid?
      expect(user).to be_valid
    end

    it "携帯電話番号が10文字以下だと登録できない" do
      user = build(:user, mobile_phone_number: "0000000000", mobile_phone_number: "0000000000")
      user.valid?
      expect(user.errors[:mobile_phone_number]).to include("is too short (minimum is 11 characters)")
    end

  end

end


RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
