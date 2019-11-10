require 'rails_helper'
require 'user_address'

describe UserAddress do
  describe '#signup3-validates' do

    it "send_name_family_kanjiが空だと保存できない" do
      user_address = build(:user_address, send_name_family_kanji: nil)
      user_address.valid?
      expect(user_address.errors[:send_name_family_kanji]).to include("can't be blank")
    end

    it "send_name_first_kanjiが空だと保存できない" do
      user_address = build(:user_address, send_name_first_kanji: nil)
      user_address.valid?
      expect(user_address.errors[:send_name_first_kanji]).to include("can't be blank")
    end

    it "send_name_family_kanaが空だと保存できない" do
      user_address = build(:user_address, send_name_family_kana: nil)
      user_address.valid?
      expect(user_address.errors[:send_name_family_kana]).to include("can't be blank")
    end

    it "send_name_first_kanaが空だと保存できない" do
      user_address = build(:user_address, send_name_first_kana: nil)
      user_address.valid?
      expect(user_address.errors[:send_name_first_kana]).to include("can't be blank")
    end

    it "zipが空だと保存できない" do
      user_address = build(:user_address, zip: nil)
      user_address.valid?
      expect(user_address.errors[:zip]).to include("can't be blank")
    end

    it "prefectureが空だと保存できない" do
      user_address = build(:user_address, prefecture: nil)
      user_address.valid?
      expect(user_address.errors[:prefecture]).to include("can't be blank")
    end

    it "cityが空だと保存できない" do
      user_address = build(:user_address, city: nil)
      user_address.valid?
      expect(user_address.errors[:city]).to include("can't be blank")
    end

  end
end

RSpec.describe UserAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
