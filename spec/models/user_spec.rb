require 'rails_helper'
describe User do
  describe '#create' do
    it "nameが空だと登録できない" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailが空だと登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "encrypted_passwordが空だと登録できない" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end

    it "nameが21文字以上だと登録できない" do
      user = build(:user, name: "n" * 21)
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "emailが50文字以上だと登録できない" do
      user = build(:user, email: "n" * 51)
      user.valid?
      expect(user.errors[:email]).to include("は50文字以内で入力してください")
    end

    it "encrypted_passwordが50文字以上だと登録できない" do
      user = build(:user, encrypted_password: "n" * 51)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は50文字以内で入力してください")
    end

    it "encrypted_passwordが6文字以上であれば登録できる" do
      user = build(:user, encrypted_password: "aaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "nameが1文字以上であれば登録できる" do
      user = build(:user, name: "a")
      expect(user).to be_valid
    end

    it "重複したemailが存在すると登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
    
    it "全のバリデーションクリアできると登録できる。name, email, encrypted_password," do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end