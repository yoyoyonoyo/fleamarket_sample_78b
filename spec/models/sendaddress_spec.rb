require 'rails_helper'

# RSpec.describe Sendaddress, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}" 
# end

describe Sendaddress do
  describe '#create_sendaddress' do

    it "s_firstnameが空かどうか" do
      sendaddress = build(:sendaddress, s_firstname: "")
      sendaddress.valid?
      expect(sendaddress.errors[:s_firstname]).to include("を入力してください")
    end

    it "s_lastnameが空かどうか" do
      sendaddress = build(:sendaddress, s_lastname: "")
      sendaddress.valid?
      expect(sendaddress.errors[:s_lastname]).to include("を入力してください")
    end

    it "s_h_firstnameが空かどうか" do
      sendaddress = build(:sendaddress, s_h_firstname: "")
      sendaddress.valid?
      expect(sendaddress.errors[:s_h_firstname]).to include("を入力してください")
    end

    it "s_h_lastnameが空かどうか" do
      sendaddress = build(:sendaddress, s_h_lastname: "")
      sendaddress.valid?
      expect(sendaddress.errors[:s_h_lastname]).to include("を入力してください")
    end

    it "zipcodeが空かどうか" do
      sendaddress = build(:sendaddress, zipcode: "")
      sendaddress.valid?
      expect(sendaddress.errors[:zipcode]).to include("を入力してください")
    end

    it "prefecturesが空かどうか" do
      sendaddress = build(:sendaddress, prefectures: "")
      sendaddress.valid?
      expect(sendaddress.errors[:prefectures]).to include("を入力してください")
    end

    it "municipalititiesが空かどうか" do
      sendaddress = build(:sendaddress, municipalitities: "")
      sendaddress.valid?
      expect(sendaddress.errors[:municipalitities]).to include("を入力してください")
    end

    it "streetaddressが空かどうか" do
      sendaddress = build(:sendaddress, streetaddress: "")
      sendaddress.valid?
      expect(sendaddress.errors[:streetaddress]).to include("を入力してください")
    end

    it "zipcodeが空かどうか" do
      sendaddress = build(:sendaddress, zipcode: "")
      sendaddress.valid?
      expect(sendaddress.errors[:zipcode]).to include("を入力してください")
    end

    it "zipcodeが7文字じゃなかった場合" do
      sendaddress = build(:sendaddress, zipcode: "123456")
      sendaddress.valid?
      expect(sendaddress.errors[:zipcode]).to include("は7文字で入力してください")
    end

    it "zipcodeが7文字だった場合" do
      sendaddress = build(:sendaddress, zipcode: "1234567")
      expect(sendaddress).to be_valid
    end

    it "番地の入力が全角（大小英数字含む）じゃなかった場合" do
      sendaddress = build(:sendaddress, streetaddress: "Sample1")
      sendaddress.valid?
      expect(sendaddress.errors[:streetaddress]).to include("は不正な値です")
    end

    it "番地の入力が全角（大小英数字含む）だった場合" do
      sendaddress = build(:sendaddress, streetaddress: "あア阿ａA１")
      expect(sendaddress).to be_valid
    end

    it "部屋番号の入力が全角（大小英数字含む）じゃなかった場合" do
      sendaddress = build(:sendaddress, room: "Sample1")
      sendaddress.valid?
      expect(sendaddress.errors[:room]).to include("は不正な値です")
    end

    it "部屋番号の入力が全角（大小英数字含む）だった場合" do
      sendaddress = build(:sendaddress, room: "あア阿ａA１")
      expect(sendaddress).to be_valid
    end

    it "roomが空の場合でも登録できるかどうか" do
      sendaddress = build(:sendaddress, room: "")
      expect(sendaddress).to be_valid
    end

  end
end