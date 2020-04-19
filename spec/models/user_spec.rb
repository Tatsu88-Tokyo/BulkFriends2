require 'rails_helper'

describe User do
  describe '#create' do
    it "全て入力されていればOK" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空ならNG" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailが空ならNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが意図しない形ならNG" do
      user = build(:user, email: "aaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it "emailが重複していたらNG" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    it "passwordが空ならNG" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが7文字よりも短ければNG" do
      user = build(:user, password: "aaa111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "passwordが半角英字のみならNG" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
    it "passwordが半角数字のみならNG" do
      user = build(:user, password: "1111111")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
  end
end